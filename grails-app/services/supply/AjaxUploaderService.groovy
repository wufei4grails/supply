package supply

import org.apache.tomcat.util.http.fileupload.FileUploadException
class AjaxUploaderService {

    static transactional = true

    void upload(InputStream inputStream, File file) {

        try {
            file << inputStream
        } catch (Exception e) {
            throw new FileUploadException(e)
        }

    }
}
