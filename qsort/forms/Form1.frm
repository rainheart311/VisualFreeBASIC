#VisualFreeBasic_Form#  Version=5.2.10
Locked=-1

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

[Button]
Name=Command1
Index=-1
Caption=整型数排序
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=22
Top=22
Width=81
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command2
Index=-1
Caption=浮点数排序
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=111
Top=23
Width=81
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command3
Index=-1
Caption=字符串排序
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=202
Top=23
Width=81
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command4
Index=-1
Caption=结构体排序
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=292
Top=23
Width=81
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。
#define BUFFER_SIZE 20   '定义排序数组大小

'整型数排序
function cmpInt cdecl(byval a as any ptr, byval b as any ptr) as long
    Return *Cast(long ptr,a) - *Cast(long Ptr,b)
End Function

Sub Form1_Command1_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Dim a(BUFFER_SIZE - 1) As long
    Print "生成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Randomize                 '随机数种子
        a(i) = int(Rnd * 100000)  '随机数
        Print a(i),
    Next
    print
    Print "排序"
    qsort(@a(0),BUFFER_SIZE, SizeOf(long),@cmpInt) 
    Print "排序完成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Print a(i),
    Next
    print
End Sub

'浮点型排序
function cmpDbl cdecl(byval a as any ptr, byval b as any ptr) as long
    Dim c As Double Ptr = Cast(Double Ptr, a)   '需要先转换类型保存
    Dim d As Double Ptr = Cast(Double Ptr, b)
    
    return IIf(*c > *d,1,-1)                    '比较
End Function

Sub Form1_Command2_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Dim a(BUFFER_SIZE - 1) As Double
    Print "生成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Randomize                 '随机数种子
        a(i) = Rnd * 100000  '随机数
        Print a(i),
    Next
    print
    Print "排序"
    qsort(@a(0),BUFFER_SIZE, SizeOf(Double),@cmpDbl) 
    Print "排序完成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Print a(i),
    Next
    print
End Sub

'字符串排序
function cmpStr cdecl(byval a as any ptr, byval b as any ptr) as long
    Dim c As ZString Ptr = Cast(ZString Ptr, a)
    Dim d As ZString Ptr = Cast(ZString Ptr, b)
    return strcmp(c,d)
End Function

Sub Form1_Command3_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Dim s As String = "0123456789"
    Dim a(BUFFER_SIZE - 1) As ZString * 10    '字符串使用ZString比较方便用于C函数库的排序
    Print "生成"
    For i As Long = 0 To BUFFER_SIZE - 1
        For j As Long = 0 To 5
            Randomize                 '随机数种子
            a(i) &= Mid(s,int(Rnd * 10) + 1,1)   '随机数
        Next j
        Print a(i), 
    Next
    print
    Print "排序"
    qsort(@a(0),BUFFER_SIZE, SizeOf(ZString * 10),@cmpStr) 
    Print "排序完成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Print a(i),
    Next
    print    
End Sub

'结构体排序
Type Student          '学生结构
    ID As Long        '学号
    Name As String    '名字
    Score As Long     '分数 
End Type

function cmpType cdecl(byval a as any ptr, byval b as any ptr) as long
    Dim c As Student Ptr = Cast(Student Ptr, a)
    Dim d As Student Ptr = Cast(Student Ptr, b)
    
    Return c->Score - d->Score  '用分数排名 从小到大
End Function

Sub Form1_Command4_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Dim a(BUFFER_SIZE - 1) As Student
    Print "生成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Randomize                 '随机数种子
        a(i).ID = int(Rnd * 10000)  '随机数
        a(i).Name = "张三" & i & "号" 
        Randomize                 '随机数种子
        a(i).Score = Int(Rnd * 120 + 1)
        Print a(i).ID,a(i).Name,a(i).Score
    Next
    print
    Print "排序"
    qsort(@a(0),BUFFER_SIZE, SizeOf(Student),@cmpType) 
    Print "排序完成"
    For i As Long = 0 To BUFFER_SIZE - 1
        Print a(i).ID,a(i).Name,a(i).Score
    Next
    print
End Sub






