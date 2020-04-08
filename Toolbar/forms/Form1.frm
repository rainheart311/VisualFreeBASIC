#VisualFreeBasic_Form#  Version=5.2.10
Locked=0

[Form]
Name=Form1
ClassStyle=CS_VREDRAW,CS_HREDRAW,CS_DBLCLKS
ClassName=
WinStyle=WS_THICKFRAME,WS_CAPTION,WS_SYSMENU,WS_MINIMIZEBOX,WS_MAXIMIZEBOX,WS_CLIPSIBLINGS,WS_CLIPCHILDREN,WS_VISIBLE,WS_EX_WINDOWEDGE,WS_EX_CONTROLPARENT,WS_EX_LEFT,WS_EX_LTRREADING,WS_EX_RIGHTSCROLLBAR,WS_POPUP,WS_SIZEBOX
Style=3 - 常规窗口
Icon=
Caption=Form1
StartPosition=1 - 屏幕中心
WindowState=0 - 正常
Enabled=True
Repeat=False
Left=0
Top=0
Width=420
Height=300
TopMost=False
Child=False
MdiChild=False
TitleBar=True
SizeBox=True
SysMenu=True
MaximizeBox=True
MinimizeBox=True
Help=False
Hscroll=False
Vscroll=False
MinWidth=0
MinHeight=0
MaxWidth=0
MaxHeight=0
NoActivate=False
MousePass=False
TransPer=0
TransColor=SYS,25
BackColor=SYS,15
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[ToolBar]
Name=ToolBar1
Button=tbrFileNew0new.png|RCDATA_NEW010100tbrFileOpen0open.png|RCDATA_OPEN010100tbrFileSave0save.png|RCDATA_SAVE010100tbr004010100tbrCut0Cut.png|RCDATA_CUT010100tbrCopy0Copy.png|RCDATA_COPY010100tbrPaste0Paste.png|RCDATA_PASTE010100
BStyle=3 - 凹边框
ImagesSize=SIZE_24
Flat=True
List=False
ToolTips=True
Transparent=False
Wrapable=False
Indent=0
Enabled=True
Visible=True
Tag=


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。

Sub Form1_Shown(hWndForm As hWnd,UserData As Integer)  '窗口完全显示后。UserData 来自显示窗口最后1个参数。
    'ToolBar1.ButtonCheck(tbrFileNew) =True     '经测试，可以选中
    printa ToolBar1.ButtonCount                 '连分割线也算一个
    ToolBar1.ButtonEnabled(tbrFileOpen) =False
    'ToolBar1.ButtonText(tbrFileSave) = "保存"   '有图标好像不能显示文本
    ToolBar1.ButtonTips(tbrCut) = "剪切"
    'ToolBar1.ButtonVisible(tbrCopy) = False     '测试，不能隐藏
End Sub

Sub Form1_ToolBar1_WM_Command(hWndForm As hWnd,wID As ULong)  '点击了按钮
   Select Case wID
      Case tbrFileNew ' 
          AfxMsg "选中【新建】"
      Case tbrFileOpen ' 
          AfxMsg "选中【打开】"
      Case tbrFileSave ' 
          AfxMsg "选中【保存】"
      Case tbr00 '分割符，不用 
      Case tbrCut ' 
          AfxMsg "选中【剪切】"
      Case tbrCopy ' 
          AfxMsg "选中【复制】"
      Case tbrPaste ' 
          AfxMsg "选中【粘贴】"
   End Select

End Sub



