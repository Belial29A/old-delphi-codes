�
 TFORM1 0H  TPF0TForm1Form1Left� TopnWidth�HeightcCaptionForm1Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TLabelLabel1Left8TopWidth� HeightuCaption�With Transparency and  Z-Buffering, 
ordering your objects is important.

In this sample, only the spheres are
transparent.

Try the various options and see the
differences ordering and blending
mode make.  TLabelLabel2Left8Top� Width^HeightCaptionCentral objects :Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel3Left8Top� WidtheHeightCaptionOrbiting spheres :Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TGLSceneViewerGLSceneViewer1LeftTopWidth)Height9FogEnvironment.FogStart       �@FogEnvironment.FogEnd       �@FogEnvironment.FogModefmLinearBackgroundColorclSilverCamera	GLCamera1  TRadioButtonRBSTCLeftHTop� Width� HeightCaptionSphere, Torus, ConeTabOrderOnClick
RBSTCClick  TRadioButtonRBTSCLeftHTop� Width� HeightCaptionTorus, Sphere, ConeTabOrderOnClick
RBTSCClick  TRadioButtonRBTCSLeftHTop� Width� HeightCaptionTorus, Cone, SphereChecked	TabOrderTabStop	OnClick
RBTCSClick  	TCheckBox	CBSortingLeftHTop WidthaHeightCaptionosFarthestFirstChecked	State	cbCheckedTabOrderOnClickCBSortingClick  	TCheckBox
CBAdditiveLeftHTopWidthiHeightCaptionAdditive blendingTabOrderOnClickCBAdditiveClick  TGLSceneGLScene1LeftTop TGLLightSourceGLLightSource1ConstAttenuation       ��?Position.Coordinates
     �A  HB  �A  �?
SpotCutOff       �@SpotDirection.Coordinates
             ��      
TDummyCubeBaseDummyCubeObjectsSortingosRenderFarthestFirstCubeSize       ��? TSphereOrbitingSphere1Position.Coordinates
      @          �?&Material.FrontProperties.Diffuse.Color
     �?  �?       ?Material.BlendingModebmTransparencyRadius       ��?  TSphereOrbitingSphere2Position.Coordinates
      �          �?&Material.FrontProperties.Diffuse.Color
     �?  �?       ?Material.BlendingModebmTransparencyRadius       ��?  
TDummyCube	DCCentralObjectsSortingosNoneCubeSize       ��? TTorusTorus1Direction.Coordinates
         �?.�;�    
PitchAngle       �@Up.Coordinates
       .�;�  ��    &Material.FrontProperties.Diffuse.Color
   ��L>�� >��y?  �?'Material.FrontProperties.Emission.Color
   ���=���=���=  �?MajorRadius     ����?MinorRadius     ����?  TConeCone1Position.Coordinates
       ���>      �?&Material.FrontProperties.Diffuse.Color
   ��z?��$>���=  �?'Material.FrontProperties.Emission.Color
   ���>��@<��`=  �?BottomRadius     ����?Height       � @  TSphereCentralSphere&Material.FrontProperties.Diffuse.Color
   ��R?��K?��~?��?'Material.FrontProperties.Emission.Color
   ��L>��L>��L>  �?Material.BlendingModebmTransparencyRadius     ����?    	TGLCamera	GLCamera1DepthOfView       �@FocalLength       �@TargetObject	DCCentralPosition.Coordinates
     �@   @   @  �?Left� Top�    TGLCadencerGLCadencer1SceneGLScene1
OnProgressGLCadencer1ProgressLeftTop0   