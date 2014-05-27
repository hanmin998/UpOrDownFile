文件的上传下载
====================
  JSPSmartUpload  
------------------
### 作用
  利用jspSmartUpload组件提供的对象及其操作方法，可以获得全部上传文件的信息，如文件名，大小，类型，扩展名及文件数据等，以方便文件的存取；能对上传文件在大小、类型等方面做出限制，这样可以滤掉不符合要求的文件。
### 相关类
#### 1.File类

  这个类包装了一个上传文件的所有信息。通过它可以得到上传文件的文件名，文件大小，扩展名，文件数据等信息。
  
* saveAs()

> 用来将文件另存为一个文件，如文件的换名保存。声明如下：

    public void saveAs(java.lang.String destFilePathName,int optionSaveAs)
        throws com.jspsmart.upload.SmartUploadException,java.io.IOException;

> 或者

    pubic void saveAs(java.lang.String destFilePathName)
        throws com.jspsmart.upload.SmartUploadException,java.io.IOException;

> 参数destFilePathName是另存为的文件名；参数optionSaveAs是另存为的选项，其值有三种，分别是SAVEAS_PHYSICAL（以操作系统的根目录为文件根目录的另存文件）、SAVEAS_VIRTUAL（以web应用程序的根目录为文件根目录的另存文件）、SAVEAS_AUTO（组件自己决定）。

* isMissing()

> 用于判断用户是否选择了文件，即提交的表单中对应的表单项是否有值，选择了文件时，返回false，否则返回true。

    public boolean isMissing();

* getFileName()

> 取文件名。

    public java.lang.String getFileName();

* getFileExt()

> 获取文件扩展名，即文件名的后缀

    public java.lang.String getFileExt();

* getSize()

> 得到文件的长度，单位是字节

    public int getSize();

#### 2.Files类
  表示所有上传文件的集合，通过它可以得到上传文件的数目，大小等信息。
  
* getCount()

> 取得上传文件的数目

    public int getCount();

* getFile()

> 取得指定位移处的文件对象File

    public com.jspsmart.upload.File getFile(int index);
    
> index为指定的位移，其值在0到getCount()-1之间

* getCollection()

> 将所有上传文件对象以Collection的形式返回，一边其他应用程序引用，浏览上传文件信息。

    public java.util.Collection getCollection();

#### 3.Request类
  等同于JSP内置对象request，对于文件上传的表单，通过request对象无法获得表单项的值，必须通过jspSmartUpload组件提供的Request对象来获取。其主要有getParameter()，getParameterValues()，getParameterNames()方法。

#### 4.SmartUpload类
  完成上传下载工作。

* initialize()

> 执行上传下载的初始化工作，必须第一个执行。

    public final void initialize(javax.servlet.jsp.PageContext pageContext);

> pageContext为JSP页面的内置对象（页面上下文）。

* upload()

> 上传文件数据，上传文件操作，第一步执行initialize方法，第二部执行这个方法。

    public void upload();

* save()

> 将上传文件保存到指定目录下，并返回保存文件数目。

    public int save(String destPathName);
    
> 或者

    public int save(String destPathName,int option);
    
> 参数含义同File类中的save()方法。

* getFiles()

> 取全部上传文件，以Files对象形式返回，可以利用Files类的方法来获取上传文件的数目信息。

    public Files getFiles();

* getRequest()

> 获取Request对象，以便由此对象获得上传表单参数值。

    public Request getRequest();


