package supply

import grails.converters.JSON
import javax.servlet.http.HttpServletRequest
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import org.apache.commons.fileupload.FileUploadException
import org.json.simple.JSONObject
import java.text.SimpleDateFormat

class ImageController {
 
    def index() { }

    def upload = {
        
        //文件保存目录路径
        String savePath = request.getRealPath("/") + "attached/";

        //文件保存目录URL
        String saveUrl  = request.getContextPath() + "/attached/";
        
        
        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
        
        
        //最大文件大小
        long maxSize = 1000000;
        
        
        //检查目录
        File uploadDir = new File(savePath);
        if(!uploadDir.isDirectory()){
//            render(getError("上传目录不存在。"));
        }
        //检查目录写权限
        if(!uploadDir.canWrite()){
//            render(getError("上传目录没有写权限。"));
        }
        
        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }
        
        
        if(!extMap.containsKey(dirName)){
            render(getError("目录名不正确。"));
        }
        
        //创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        
        try {  
            def f = request.getFile('imgFile') 
           
            if(!f.empty){  
                def fileName=f.getOriginalFilename() //得到文件名称 
                 
                String fileType = ".jpg";  
                if(fileName!=null && fileName!=''){  
                    fileType = fileName.substring(fileName.indexOf(".")) //得到文件类型  
                }  

                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + fileType;
		
                
                def file= new File(savePath, newFileName);
                
                if(!file.exists()){  
                    file.mkdirs()//如果file不存在自动创建  
                }  
                f.transferTo(file) //上传  
  
                JSONObject obj = new JSONObject();
		obj.put("error", 0);
		obj.put("url", saveUrl + newFileName);
//                println(obj.toJSONString())
		render(obj.toJSONString());
            }  
        } catch (Exception e) {  
            e.printStackTrace()  
            render("")  
        }   
    }
    
    
    
    private String getError(String message) {
	JSONObject obj = new JSONObject();
	obj.put("error", 1);
	obj.put("message", message);
	return obj.toJSONString();
    }

}


