package supply

import grails.converters.JSON
import javax.servlet.http.HttpServletRequest
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import org.apache.commons.fileupload.FileUploadException

class ImageController {
 
    def index() { }

    def upload = {
//        def documentInstance = new Document(params)  
        def url = params.imgFile  
        // println url  
  
        def f = request.getFile('imgFile')  
        if(!f.empty) {  
            def webRootDir = servletContext.getRealPath("/")  
            println webRootDir  
            def userDir = new File(webRootDir, "/payload/")  
            userDir.mkdirs()  
            f.transferTo( new File( userDir, f.originalFilename))  
//            documentInstance.fileName = f.originalFilename  
        }  
//        documentInstance.save()  
//        documentInstance.errors.each{  
//            println it  
//        }  
  
//        if(!documentInstance.hasErrors() && documentInstance.save()) {  
//            flash.message = "上传成功"  
//            redirect(action:show,id:documentInstance.id)  
//        }  
//        else {  
//            render(view:'create',model:[documentInstance:documentInstance])  
//        }  

    }

}
