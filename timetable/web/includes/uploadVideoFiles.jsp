<%@page import="database.Database"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  
   
    String saveFile =new String();
    String contentType=request.getContentType();
//    out.println(contentType);
    if((contentType!=null) && (contentType.indexOf("multipart/form-data")>=0)){
        DataInputStream in=new DataInputStream(request.getInputStream());
        int formDataLength=request.getContentLength();
        byte dataBytes[]=new byte[formDataLength];
        int byteRead=0;
        int totalBytesRead=0;
        while(totalBytesRead<formDataLength)
        {
            byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
            totalBytesRead+=byteRead;
        }
        
        String file=new String(dataBytes,"CP1256");
        
        saveFile=file.substring(file.indexOf("filename=\"")+ 10);
        saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
        saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
        
        int lastIndex=contentType.lastIndexOf("=");
        String boundary=contentType.substring(lastIndex+1, contentType.length());
        
        int pos;
        pos=file.indexOf("filename=\"");
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        
        int boundaryLocation=file.indexOf(boundary,pos);
        
        //int startPos=((file.substring(0,pos)).getBytes()).length;
        int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
        //int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
        //out.println(file);
        //out.println(endPos);
        String saveFile1="C:/Users/Akshay Bahadarpure/Documents/NetBeansProjects/elearning/web/uploads/files/"+saveFile;
        File ff=new File(saveFile1);
        try{
            FileOutputStream fileout=new FileOutputStream(ff);
            fileout.write(dataBytes,startPos,(endPos-startPos));
            fileout.flush();
            Database db=new Database();
            String subject=request.getParameter("subject");
            String name=request.getParameter("name");
            String year=request.getParameter("year");
            String semester=request.getParameter("semester");
            int mid=Integer.parseInt(request.getParameter("mid"));
            ResultSet rss=db.getFacultyById(mid);
            rss.next();
            String branch=rss.getString("branch");
            int res=db.update_delete("insert into faculty_videos (faculty_id,file,name,subject,year,semester,branch) values("+mid+",'"+saveFile+"','"+name+"','"+subject+"','"+year+"','"+semester+"','"+branch+"')");
            if(res>0){
                response.sendRedirect("../faculty-videos.jsp?status=22");
            }else{
                response.sendRedirect("../faculty-videos.jsp?status=0");
            }
        }catch(Exception e){
            out.println(e);
            System.out.println(e.getMessage());
        }
    }
%>