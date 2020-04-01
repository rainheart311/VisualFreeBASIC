#VisualFreeBasic_Form#  Version=5.2.9
Locked=0

[Form]
Name=Form1
ClassStyle=CS_DBLCLKS,CS_HREDRAW,CS_VREDRAW
ClassName=
WinStyle=WS_VISIBLE,WS_EX_CONTROLPARENT,WS_EX_LEFT,WS_EX_LTRREADING,WS_EX_RIGHTSCROLLBAR,WS_BORDER,WS_MAXIMIZEBOX,WS_MINIMIZEBOX,WS_CLIPSIBLINGS,WS_CLIPCHILDREN,WS_SYSMENU,WS_CAPTION,WS_POPUP,WS_SIZEBOX
Style=3 - 常规窗口
Icon=Default.ico|ICON_DEFAULT
Caption=第一个例子
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


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。

Sub Form1_Shown(hWndForm As hWnd,UserData As Integer)  '窗口完全显示后。UserData 来自显示窗口最后1个参数。
    
End Sub

Sub Form1_WM_Create(hWndForm As hWnd,UserData As Integer)  '完成创建窗口及所有的控件后，此时窗口还未显示。注：自定义消息里 WM_Create 此时还未创建控件和初始赋值。
    
End Sub

Sub Form1_WM_Size(hWndForm As hWnd, fwSizeType As Long, nWidth As Long, nHeight As Long)  '窗口已经改变了大小
   'fwSizeType = SIZE_MAXHIDE     SIZE_MAXIMIZED   SIZE_MAXSHOW    SIZE_MINIMIZED    SIZE_RESTORED  
   ''            其他窗口最大化   窗口已最大化     其他窗口恢复    窗口已最小化      窗口已调整大小
   if fwSizeType = SIZE_MINIMIZED Then Return 
   'xxx.Move AfxScaleX(5), AfxScaleY(5), nWidth - AfxScaleX(10), nHeight - AfxScaleY(30)
       
End Sub

Function Form1_WM_Close(hWndForm As hWnd) As LResult  '即将关闭窗口，返回非0可阻止关闭
    if AfxMsg("你真的要关闭窗体吗", "询问", MB_OKCANCEL) = IDCANCEL Then  '如果按取消
        Function = True                                                 '则停止关闭窗口
    Else                                                                '否则关闭窗口
        Function = FALSE ' 如果想阻止窗口关闭，则应返回 TRUE 。
    End If
End Function

Function Form1_Custom(hWndForm As hWnd, wMsg As UInteger, wParam As wParam, lParam As lParam) As LResult  '自定义消息（全部消息），在其它事件处理后才轮到本事件。
   Select Case wMsg 
      Case    

      Case    

      Case 
         
   End Select 
   Function = FALSE ' 若不想系统继续处理此消息，则应返回 TRUE （俗称吃掉消息）。
End Function

Sub Form1_WM_LButtonDown(hWndForm As hWnd, MouseFlags As Long, xPos As Long, yPos As Long)  '按下鼠标左键
   'MouseFlags  MK_CONTROL   MK_LBUTTON     MK_MBUTTON     MK_RBUTTON    MK_SHIFT     MK_XBUTTON1       MK_XBUTTON2 
   ''           CTRL键按下   鼠标左键按下   鼠标中键按下   鼠标右键按下  SHIFT键按下  第一个X按钮按下   第二个X按钮按下
   '检查什么键按下用  If (MouseFlags And MK_CONTROL)<>0 Then CTRL键按下 
   
End Sub

Sub Form1_WM_LButtonUp(hWndForm As hWnd, MouseFlags As Long, xPos As Long, yPos As Long)  '释放鼠标左键
   'MouseFlags  MK_CONTROL   MK_LBUTTON     MK_MBUTTON     MK_RBUTTON    MK_SHIFT     MK_XBUTTON1       MK_XBUTTON2 
   ''           CTRL键按下   鼠标左键按下   鼠标中键按下   鼠标右键按下  SHIFT键按下  第一个X按钮按下   第二个X按钮按下
   '检查什么键按下用  If (MouseFlags And MK_CONTROL)<>0 Then CTRL键按下 
   
End Sub

Sub Form1_WM_RButtonDown(hWndForm As hWnd, MouseFlags As Long, xPos As Long, yPos As Long)  '按下鼠标右键
   'MouseFlags  MK_CONTROL   MK_LBUTTON     MK_MBUTTON     MK_RBUTTON    MK_SHIFT     MK_XBUTTON1       MK_XBUTTON2 
   ''           CTRL键按下   鼠标左键按下   鼠标中键按下   鼠标右键按下  SHIFT键按下  第一个X按钮按下   第二个X按钮按下
   '检查什么键按下用  If (MouseFlags And MK_CONTROL)<>0 Then CTRL键按下 
   
End Sub

Sub Form1_WM_RButtonUp(hWndForm As hWnd, MouseFlags As Long, xPos As Long, yPos As Long)  '释放鼠标右键
   'MouseFlags  MK_CONTROL   MK_LBUTTON     MK_MBUTTON     MK_RBUTTON    MK_SHIFT     MK_XBUTTON1       MK_XBUTTON2 
   ''           CTRL键按下   鼠标左键按下   鼠标中键按下   鼠标右键按下  SHIFT键按下  第一个X按钮按下   第二个X按钮按下
   '检查什么键按下用  If (MouseFlags And MK_CONTROL)<>0 Then CTRL键按下 
   
End Sub

Sub Form1_WM_MouseMove(hWndForm As hWnd, MouseFlags As Long, xPos As Long, yPos As Long)  '移动鼠标
   'MouseFlags  MK_CONTROL   MK_LBUTTON     MK_MBUTTON     MK_RBUTTON    MK_SHIFT     MK_XBUTTON1       MK_XBUTTON2 
   ''           CTRL键按下   鼠标左键按下   鼠标中键按下   鼠标右键按下  SHIFT键按下  第一个X按钮按下   第二个X按钮按下
   '检查什么键按下用  If (MouseFlags And MK_CONTROL)<>0 Then CTRL键按下 
   
End Sub

















