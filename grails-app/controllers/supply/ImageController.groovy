package supply

import grails.converters.JSON
import javax.servlet.http.HttpServletRequest
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import org.apache.commons.fileupload.FileUploadException

class ImageController {
 
    def index() { }
    
    AjaxUploaderService ajaxUploaderService

    def upload = {
        try {

            File uploaded = createTemporaryFile()
            InputStream inputStream = selectInputStream(request)

            ajaxUploaderService.upload(inputStream, uploaded)

            return render(text: [success:true] as JSON, contentType:'text/json')

        } catch (FileUploadException e) {

            log.error("Failed to upload file.", e)
            return render(text: [success:false] as JSON, contentType:'text/json')

        }

    }

    private InputStream selectInputStream(HttpServletRequest request) {
        if (request instanceof MultipartHttpServletRequest) {
            MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
            return uploadedFile.inputStream
        }
        return request.inputStream
    }

    private File createTemporaryFile() {
        println(grailsApplication.config.grails.views.gsp.encoding)
        File uploaded
        
        println(grailsApplication.config.imageUpload)
        if (grailsApplication.config.imageUpload?.containsKey('temporaryFile')) {
            uploaded = new File("${grailsApplication.config.imageUpload.temporaryFile}")
        } else {
            uploaded = File.createTempFile('grails', 'ajaxupload')
        }
        return uploaded
    }
}
