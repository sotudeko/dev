import groovy.json.JsonSlurper
import groovy.json.JsonOutput
import static groovy.json.JsonOutput.*
import groovy.cli.picocli.CliBuilder


class IQApplications {

    static void main(String[] args) {
        String iqReportsDir = '/opt/nxiq/sonatype-work/clm-server/report'

        def applicationsMap = getApplications()
        
        def cli = new CliBuilder()

        cli.url(type: String, 'url-arg')
        cli.name(type: String, 'name-arg')
        cli.raw(type: Boolean, 'raw-arg')

        println()
        println('Nexus IQ Applications')
        println()

        File dir = new File(iqReportsDir)

        String[] applications = dir.list()
        int numberOfApplications = 0
 
        for (String applicationId : applications) {
            if (!applicationId.startsWith(".")){
                numberOfApplications++
                def applicationName = applicationsMap[applicationId].name 
                int numberOfReports = countApplicationReports(iqReportsDir + '/' + applicationId)

                println('name: ' + applicationName)
                println('  id: ' + applicationId )
                println('  number of scans: ' + numberOfReports)
                reportDates(iqReportsDir + '/' + applicationId)
                println()
            }
        }

        // File[] files = dir.listFiles()

        // for (File app: files){
        //     if (!app.getName().startsWith(".")){
        //         System.out.println(app.getName() + ':' + app.size())
        //     }
        // }

        println('Number of applications: ' + numberOfApplications)
        println()

    }

    static def countApplicationReports(applicationReportsDir){
        File dir = new File(applicationReportsDir)
        String[] reports = dir.list()
        int numberOfReports = 0

        for (String reportId : reports) {
            if (!reportId.startsWith(".")){
                numberOfReports++
                //System.out.println('-->' + reportId)
            }
        }

        return numberOfReports
    }

    static reportDates(applicationReportsDir){
        File reportsDir = new File(applicationReportsDir)
        File[] reports = reportsDir.listFiles()

        def map = [:]

        for (File reportId : reports) {
            if (!reportId.getName().startsWith(".")){
                map[reportId.lastModified()] = [name: reportId.getName()]
            }
        }

        for (entry in map.sort{it.key}) {
            def fmt = new Date(entry.key).format('EEE MMM dd hh:mm:ss a yyyy')
            println "    $entry.value.name : $fmt [$entry.key]"
        }   

        // println('  reports: ')
        // for (File reportId : reports) {
        //     if (!reportId.getName().startsWith(".")){
        //         def epoch = reportId.lastModified()
        //         def fmt = new Date(reportId.lastModified()).format('EEE MMM dd hh:mm:ss a yyyy')
        //         System.out.println('    ' + reportId.getName() + ': ' + fmt)
        //     }
        // }
    }

    static getApplications(){
        def map = [:]
        def repositoryUrl = 'http://localhost:8070'

        def endpoint = repositoryUrl + '/api/v2/applications'

        def url = new URL(endpoint)
        def applicationsConnection = url.openConnection()

        applicationsConnection.requestMethod = 'GET'
        applicationsConnection.setRequestProperty("Authorization", "Basic YWRtaW46YWRtaW4xMjM=")

        if (applicationsConnection.responseCode == 200) {
            def applicationsContent = applicationsConnection.content.text

            def jsonSlurper = new JsonSlurper()
            def applicationsJsonObject = jsonSlurper.parseText(applicationsContent)

            applicationsJsonObject.applications.each {
                // println JsonOutput.prettyPrint(JsonOutput.toJson(it))

                String applicationId = it.id
                String applicationName = it.name
                String contactName = it.contactUserName
                String publicId = it.publicId

                map[applicationId] = [name: applicationName, publicId: publicId, contactName: contactName]
            }
        }

        return map
    }
}





