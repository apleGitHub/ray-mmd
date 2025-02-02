#include "ray.conf"
#include "ray_advanced.conf"

const float4 BackColor = 0.0;
const float4 WhiteColor = 1.0;
const float ClearDepth = 1.0;
const int ClearStencil = 0;

float mSunLightP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SunLight+";>;
float mSunLightM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SunLight-";>;
float mSunShadowRP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SunShadowR+";>;
float mSunShadowGP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SunShadowG+";>;
float mSunShadowBP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SunShadowB+";>;
float mSunShadowVM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SunShadowV-";>;
float mSSAOP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSAO+";>;
float mSSAOM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSAO-";>;
float mSSAORadiusP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSAORadius+";>;
float mSSAORadiusM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSAORadius-";>;
float mSSDOP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSDO+";>;
float mSSDOM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSDO-";>;
float mSSSSP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSSS+";>;
float mSSSSM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "SSSS-";>;
float mExposureP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Exposure+";>;
float mExposureM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Exposure-";>;
float mFstopP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Fstop+";>;
float mFstopM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Fstop-";>;
float mFocalLengthP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "FocalLength+";>;
float mFocalLengthM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "FocalLength-";>;
float mFocalDistanceP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "FocalDistance+";>;
float mFocalDistanceM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "FocalDistance-";>;
float mFocalRegionP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "FocalRegion+";>;
float mFocalRegionM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "FocalRegion-";>;
float mMeasureMode : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "MeasureMode";>;
float mTestMode : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "TestMode";>;
float mVignette : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Vignette";>;
float mDispersion : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Dispersion";>;
float mDispersionRadius : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "DispersionRadius";>;
float mBloomThresholdP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomThreshold";>;
float mBloomRadiusP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomRadius+";>;
float mBloomRadiusM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomRadius-";>;
float mBloomColorAllHP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomColorAllH+";>;
float mBloomColorAllSP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomColorAllS+";>;
float mBloomColorAllVP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomColorAllV+";>;
float mBloomColorAllVM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomColorAllV-";>;
float mBloomStarFade : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BloomStarFade";>;
float mContrastP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Contrast+";>;
float mContrastM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Contrast-";>;
float mSaturationP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Saturation+";>;
float mSaturationM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Saturation-";>;
float mGammaP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Gamma+";>;
float mGammaM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Gamma-";>;
float mColBalanceRP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BalanceR+";>;
float mColBalanceGP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BalanceG+";>;
float mColBalanceBP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BalanceB+";>;
float mColBalanceRM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BalanceR-";>;
float mColBalanceGM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BalanceG-";>;
float mColBalanceBM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "BalanceB-";>;
float mTemperatureP : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Temperature+";>;
float mTemperatureM : CONTROLOBJECT<string name="ray_controller.pmx"; string item = "Temperature-";>;

static float mSSAOScale = lerp(lerp(mSSDOIntensityMin, mSSDOIntensityMax, mSSAOP), 0, mSSAOM);
static float mSSAORadius = lerp(lerp(1.0, 2.0, mSSAORadiusP), 0.5, mSSAORadiusM);
static float mSSDOScale = lerp(lerp(mSSDOIntensityMin, mSSDOIntensityMax, mSSDOP), 0, mSSDOM);
static float mSSSSScale = lerp(lerp(mSSSSIntensityMin, mSSSSIntensityMax, mSSSSP), 0.25, mSSSSM);
static float mSunIntensity = lerp(lerp(mLightIntensityMin, mLightIntensityMax, mSunLightP), 0, mSunLightM);
static float mExposure = lerp(lerp(mExposureMin, mExposureMax, mExposureP), 0, mExposureM);
static float mBloomRadius = lerp(lerp(2.2, 10, mBloomRadiusP), 0.1, mBloomRadiusM);
static float mBloomThreshold = (1.0 - mBloomThresholdP) / (mBloomThresholdP + 1e-5);
static float mColorContrast = lerp(lerp(1, 2, mContrastP), 0.5, mContrastM);
static float mColorSaturation = lerp(lerp(1, 2, mSaturationP), 0.0, mSaturationM);
static float mColorGamma = lerp(lerp(1.0, 0.45, mGammaP), 2.2, mGammaM);
static float mColorTemperature = lerp(lerp(mTemperature, 1000, mTemperatureP), 40000, mTemperatureM);
static float3 mColorShadowSunP = pow(float3(mSunShadowRP, mSunShadowGP, mSunShadowBP), 2);
static float3 mColorBalanceP = float3(mColBalanceRP, mColBalanceGP, mColBalanceBP);
static float3 mColorBalanceM = float3(mColBalanceRM, mColBalanceGM, mColBalanceBM);

float mSunLayer0FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer0-";>;
float mSunLayer1FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer1-";>;
float mSunLayer2FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer2-";>;
float mSunLayer3FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer3-";>;
float mSunLayer4FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer4-";>;
float mSunLayer5FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer5-";>;
float mSunLayer6FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer6-";>;
float mSunLayer7FadeM : CONTROLOBJECT<string name="sun_controller.pmx"; string item = "Layer7-";>;

static float2x4 mSunLayers = {
	mSunLayer0FadeM, mSunLayer1FadeM, mSunLayer2FadeM, mSunLayer3FadeM,
	mSunLayer4FadeM, mSunLayer5FadeM, mSunLayer6FadeM, mSunLayer7FadeM
};

float mSSRSmoothnessP : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Smoothness+";>;
float mSSRSmoothnessM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Smoothness-";>;
float mSSRBlurP : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Blur+";>;
float mSSRBlurM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Blur-";>;
float mSSRThicknessP : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Thickness+";>;
float mSSRThicknessM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Thickness-";>;
float mSSROffsetP : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Offset+";>;
float mSSROffsetM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Offset-";>;
float mSSRBrightnessP : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Brightness+";>;
float mSSRBrightnessM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Brightness-";>;
float mSSRFresnelP : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Fresnel+";>;
float mSSRFresnelM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Fresnel-";>;
float mSSRLayer0FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer0-";>;
float mSSRLayer1FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer1-";>;
float mSSRLayer2FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer2-";>;
float mSSRLayer3FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer3-";>;
float mSSRLayer4FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer4-";>;
float mSSRLayer5FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer5-";>;
float mSSRLayer6FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer6-";>;
float mSSRLayer7FadeM : CONTROLOBJECT<string name="ssr_controller.pmx"; string item = "Layer7-";>;

static float2x4 mSSRLayers = {
	mSSRLayer0FadeM, mSSRLayer1FadeM, mSSRLayer2FadeM, mSSRLayer3FadeM,
	mSSRLayer4FadeM, mSSRLayer5FadeM, mSSRLayer6FadeM, mSSRLayer7FadeM
};

static float mSSRBlur = lerp(lerp(1024, 512, mSSRBlurP), 4096, mSSRBlurM);
static float mSSRThickness = lerp(lerp(0.5, 5, mSSRThicknessP), 0.01, mSSRThicknessM);
static float mSSROffset = lerp(lerp(0.1, 2, mSSROffsetP), 0.05, mSSROffsetM);
static float mSSRSmoothness = lerp(lerp(0.0, 2, mSSRSmoothnessP), -1, mSSRSmoothnessM);
static float mSSRBrightness = lerp(lerp(1, 10, mSSRBrightnessP), 0, mSSRBrightnessM);
static float mSSRFresnel = lerp(lerp(0.5, 1, mSSRFresnelP), 0, mSSRFresnelM); 

#include "shader/math.fxsub"
#include "shader/common.fxsub"
#include "shader/textures.fxsub"
#include "shader/gbuffer.fxsub"
#include "shader/ibl.fxsub"
#include "shader/BRDF.fxsub"
#include "shader/ColorGrading.fxsub"
#include "shader/Layer.fxsub"
#include "shader/ShadingMaterials.fxsub"

#if SUN_SHADOW_QUALITY && SUN_LIGHT_ENABLE
#	include "shader/ShadowMapCascaded.fxsub"
#	include "shader/CascadeShadow.fxsub"
#	include "shader/ShadowSamplingTent.fxsub"
#	include "shader/ShadowMap.fxsub"
#endif

#if SSDO_QUALITY && (IBL_QUALITY || SUN_LIGHT_ENABLE)
#	include "shader/PostProcessOcclusion.fxsub"
#endif

#if SSSS_QUALITY
#	include "shader/PostProcessScattering.fxsub"
#endif

#if OUTLINE_QUALITY == 2
#	include "shader/EdgeLineAA.fxsub"
#endif

#if TOON_ENABLE == 2
#	include "shader/PostProcessDiffusion.fxsub"
#endif

#if SSR_QUALITY
#   include "shader/HZB.fxsub"
#endif

#if SSR_QUALITY
#	include "shader/PostProcessSSR.fxsub"
#endif

#if BOKEH_QUALITY
#	include "shader/PostProcessHexDOF.fxsub"
#endif

#if HDR_EYE_ADAPTATION
#	include "shader/PostProcessEyeAdaptation.fxsub"
#endif

#if HDR_STAR_MODE
#	include "shader/PostProcessLensflare.fxsub"
#endif

#if HDR_FLARE_MODE
#	include "shader/PostProcessGhost.fxsub"
#endif

#if HDR_BLOOM_MODE
#	include "shader/PostProcessBloom.fxsub"
#endif

#include "shader/PostProcessHDR.fxsub"

#if AA_QUALITY == 1
#	include "shader/FXAA3.fxsub"
#endif

#if AA_QUALITY >= 2 && AA_QUALITY <= 5
#	include "shader/SMAA.fxsub"
#endif

#if AA_QUALITY == 6
#	include "shader/CameraMotion.fxsub"
#endif

#if AA_QUALITY == 6
#	include "shader/TAA.fxsub"
#endif

float4 ScreenSpaceQuadVS(
	in float4 Position : POSITION,
	in float4 Texcoord : TEXCOORD,
	out float4 oTexcoord0 : TEXCOORD0,
	out float3 oTexcoord1 : TEXCOORD1) : POSITION
{
	oTexcoord0 = Texcoord;
	oTexcoord0.xy += ViewportOffset;
	oTexcoord0.zw = oTexcoord0.xy * ViewportSize;
	oTexcoord1 = -mul(Position, matProjectInverse).xyz;
	return Position;
}

float4 ScreenSpaceQuadOffsetVS(
	in float4 Position : POSITION,
	in float2 Texcoord : TEXCOORD,
	out float2 oTexcoord : TEXCOORD0,
	uniform float2 offset) : POSITION
{
	oTexcoord = Texcoord + offset * 0.5;
	return Position;
}

float Script : STANDARDSGLOBAL<
	string ScriptOutput = "color";
	string ScriptClass  = "scene";
	string ScriptOrder  = "postprocess";
> = 0.8;

technique DeferredLighting<
	string Script =
	"RenderColorTarget=ScnMap;"
	"RenderDepthStencilTarget=DepthBuffer;"
	"ClearSetColor=BackColor;"
	"ClearSetDepth=ClearDepth;"
	"ClearSetStencil=ClearStencil;"
	"Clear=Color;"
	"Clear=Depth;"
	"ScriptExternal=Color;"

#if SUN_SHADOW_QUALITY && SUN_LIGHT_ENABLE
	"RenderColorTarget=ShadowMap;"
	"ClearSetColor=WhiteColor;"
	"Clear=Color;"
	"Pass=ShadowMapGen;"
	"ClearSetColor=BackColor;"
#if SHADOW_BLUR_COUNT
	"RenderColorTarget=ShadowMapTemp; Pass=ShadowBlurX;"
	"RenderColorTarget=ShadowMap;	  Pass=ShadowBlurY;"
#endif
#endif

#if SSDO_QUALITY && (IBL_QUALITY || SUN_LIGHT_ENABLE)
	"RenderColorTarget=SSDOMap; Pass=SSDO;"
#if SSDO_BLUR_RADIUS
	"RenderColorTarget=SSDOMapTemp; Pass=SSDOBlurX;"
	"RenderColorTarget=SSDOMap;	    Pass=SSDOBlurY;"
#endif
#endif

#if OUTLINE_QUALITY == 2
	"RenderColorTarget=EdgeEdgeMap;  Clear=Color; Pass=EdgeEdgeDetection;"
	"RenderColorTarget=EdgeBlendMap; Clear=Color; Pass=EdgeBlendingWeightCalculation;"
	"RenderColorTarget=OutlineTempMap; Pass=EdgeNeighborhoodBlending;"
#endif

#if SSSS_QUALITY
	"RenderColorTarget0=ShadingMapTemp;"
	"RenderColorTarget1=ShadingMapTempSpecular;"
	"Pass=ShadingOpacity;"
	"RenderColorTarget1=;"

	"RenderDepthStencilTarget=DepthBuffer;"
	"RenderColorTarget=;"
	"Clear=Depth;"
	"Pass=SSSSStencilTest;"
	"RenderColorTarget=ShadingMap; Clear=Color; Pass=SSSSBlurX;"
	"RenderColorTarget=ShadingMapTemp;	Pass=SSSSBlurY;"
	"RenderColorTarget=ShadingMapTemp;	Pass=ShadingOpacityAlbedo;"
	"RenderColorTarget=ShadingMapTemp;	Pass=ShadingOpacitySpecular;"
	"RenderColorTarget=ShadingMap;		Pass=ShadingTransparent;"
#else
	"RenderColorTarget=ShadingMapTemp;	Pass=ShadingOpacity;"
	"RenderColorTarget=ShadingMap;		Pass=ShadingTransparent;"
#endif

#if TOON_ENABLE == 2
	"RenderColorTarget=ShadingMapTemp; 	Pass=DiffusionBlurX;"
	"RenderColorTarget=ShadingMap; 		Pass=DiffusionBlurY;"
#endif

#if SSR_QUALITY
	"RenderColorTarget=ZBufferMipmap1;		  	  Pass=ZBufferMipmap1;"
	"RenderColorTarget=ZBufferMipmap2;		      Pass=ZBufferMipmap2;"
	"RenderColorTarget=ZBufferMipmap3;		      Pass=ZBufferMipmap3;"
	"RenderColorTarget=ZBufferMipmap4;		 	  Pass=ZBufferMipmap4;"
	"RenderColorTarget=ZBufferMipmap5;		      Pass=ZBufferMipmap5;"
	"RenderColorTarget=ZBufferMipmap6;		      Pass=ZBufferMipmap6;"
	"RenderColorTarget=ZBufferMipmap7;		      Pass=ZBufferMipmap7;"
	"RenderColorTarget=ZBufferMipmap8;		      Pass=ZBufferMipmap8;"
	"RenderColorTarget=ZBufferMipmap9;		      Pass=ZBufferMipmap9;"
	"RenderColorTarget=ZBufferMipmap10;		      Pass=ZBufferMipmap10;"

 	"RenderColorTarget=ZBufferMipmap;		      Pass=ZBufferCombine;"
#endif

#if SSR_QUALITY
	"RenderColorTarget=SSRLightX1Map;"
	"Clear=Color;"
	"Pass=SSRConeTracing;"

	"RenderColorTarget=SSRLightX1MapTemp; Pass=SSRGaussionBlurX1;"
	"RenderColorTarget=SSRLightX1Map;	  Pass=SSRGaussionBlurY1;"
	"RenderColorTarget=SSRLightX2MapTemp; Pass=SSRGaussionBlurX2;"
	"RenderColorTarget=SSRLightX2Map;	  Pass=SSRGaussionBlurY2;"
	"RenderColorTarget=SSRLightX3MapTemp; Pass=SSRGaussionBlurX3;"
	"RenderColorTarget=SSRLightX3Map;	  Pass=SSRGaussionBlurY3;"
	"RenderColorTarget=SSRLightX4MapTemp; Pass=SSRGaussionBlurX4;"
	"RenderColorTarget=SSRLightX4Map;	  Pass=SSRGaussionBlurY4;"

	"RenderColorTarget=ShadingMap;		  Pass=SSRFinalCombie;"
#endif

#if BOKEH_QUALITY
	"RenderColorTarget0=AutoFocalMap; Pass=ComputeFocalDistance;"

	"RenderColorTarget0=FocalBokehMap; Pass=ComputeDepthBokeh;"

	"RenderColorTarget0=FocalBlur1Map;"
	"RenderColorTarget1=FocalBlur2Map;"
	"Clear=Color;"
	"Pass=ComputeHexBlurFarX;"

	"RenderColorTarget0=FocalBokehFarMap;"
	"RenderColorTarget1=;"
	"Clear=Color;"
	"Pass=ComputeHexBlurFarY;"

	"RenderColorTarget=FocalBokehTempMap; Pass=ComputeBokehFarGather;"

	"RenderColorTarget=FocalBokehCoCNearMap; Pass=ComputeNearDown;"
	"RenderColorTarget=FocalBokehTempMap;    Clear=Color; Pass=ComputeSmoothingNearX;"
	"RenderColorTarget=FocalBokehCoCNearMap; Clear=Color; Pass=ComputeSmoothingNearY;"
	"RenderColorTarget=FocalBokehTempMap;    Clear=Color; Pass=ComputeNearCoC;"
	"RenderColorTarget=FocalBokehCoCNearMap; Clear=Color; Pass=ComputeNearSamllBlur;"

	"RenderColorTarget=ShadingMap; Pass=ComputeBokehGatherFinal;"
#endif

#if HDR_EYE_ADAPTATION
	"RenderColorTarget=EyeLumMap; 	 Pass=EyeLum;"
	"RenderColorTarget=EyeLumAveMap; Pass=EyeAdapation;"
#endif

#if HDR_BLOOM_MODE
	"RenderColorTarget=DownsampleMap1st; Pass=GlareDetection;"
#if HDR_STAR_MODE || HDR_FLARE_MODE
	"RenderColorTarget=DownsampleMap2nd; Pass=HDRDownsample2nd;"
#endif
	"RenderColorTarget=BloomMap1stTemp;  Pass=BloomBlurX1;"
	"RenderColorTarget=BloomMap1st;		 Pass=BloomBlurY1;"
	"RenderColorTarget=BloomMap2nd;		 Pass=BloomDownsampleX2;"
	"RenderColorTarget=BloomMap2ndTemp;  Pass=BloomBlurX2;"
	"RenderColorTarget=BloomMap2nd;		 Pass=BloomBlurY2;"
	"RenderColorTarget=BloomMap3rd;		 Pass=BloomDownsampleX3;"
	"RenderColorTarget=BloomMap3rdTemp;  Pass=BloomBlurX3;"
	"RenderColorTarget=BloomMap3rd;		 Pass=BloomBlurY3;"
	"RenderColorTarget=BloomMap4th;		 Pass=BloomDownsampleX4;"
	"RenderColorTarget=BloomMap4thTemp;  Pass=BloomBlurX4;"
	"RenderColorTarget=BloomMap4th;		 Pass=BloomBlurY4;"
	"RenderColorTarget=BloomMap5th;		 Pass=BloomDownsampleX5;"
	"RenderColorTarget=BloomMap5thTemp;  Pass=BloomBlurX5;"
	"RenderColorTarget=BloomMap5th;		 Pass=BloomBlurY5;"
#if HDR_STAR_MODE == 1 || HDR_STAR_MODE == 2
	"RenderColorTarget=StreakMap1stTemp; Pass=Star1stStreak1st;"
	"RenderColorTarget=StreakMap1st;	 Pass=Star1stStreak2nd;"
	"RenderColorTarget=StreakMap1stTemp; Pass=Star1stStreak3rd;"
	"RenderColorTarget=StreakMap1st;	 Pass=Star1stStreak4th;"
	"RenderColorTarget=StreakMap2ndTemp; Pass=Star2ndStreak1st;"
	"RenderColorTarget=StreakMap2nd;	 Pass=Star2ndStreak2nd;"
	"RenderColorTarget=StreakMap2ndTemp; Pass=Star2ndStreak3rd;"
	"RenderColorTarget=StreakMap2nd;	 Pass=Star2ndStreak4th;"
#endif
#if HDR_STAR_MODE == 3 || HDR_STAR_MODE == 4
	"RenderColorTarget=StreakMap1st;	 Pass=Star1stStreak1st;"
	"RenderColorTarget=StreakMap1stTemp; Pass=Star1stStreak2nd;"
	"RenderColorTarget=StreakMap1st;	 Pass=Star1stStreak3rd;"
	"RenderColorTarget=StreakMap2nd;	 Pass=Star2ndStreak1st;"
	"RenderColorTarget=StreakMap2ndTemp; Pass=Star2ndStreak2nd;"
	"RenderColorTarget=StreakMap2nd;	 Pass=Star2ndStreak3rd;"
	"RenderColorTarget=StreakMap3rd;	 Pass=Star3rdStreak1st;"
	"RenderColorTarget=StreakMap3rdTemp; Pass=Star3rdStreak2nd;"
	"RenderColorTarget=StreakMap3rd;	 Pass=Star3rdStreak3rd;"
	"RenderColorTarget=StreakMap4th;	 Pass=Star4thStreak1st;"
	"RenderColorTarget=StreakMap4thTemp; Pass=Star4thStreak2nd;"
	"RenderColorTarget=StreakMap4th;	 Pass=Star4thStreak3rd;"
#endif
	"RenderColorTarget=BloomMap1st;		Pass=GlareLightComp;"
#if HDR_FLARE_MODE
	"RenderColorTarget=BloomMap1stTemp; Pass=GhostImage1st;"
	"RenderColorTarget=BloomMap1st;		Pass=GhostImage2nd;"
#endif
#endif

#if AA_QUALITY == 0
	"RenderColorTarget=;"
	"RenderDepthStencilTarget=;"
	"Pass=HDRTonemapping;"
#else
	"RenderColorTarget=ShadingMapTemp;"
	"Pass=HDRTonemapping;"
#endif

#if AA_QUALITY == 1
	"RenderColorTarget=;"
	"RenderDepthStencilTarget=;"
	"Pass=FXAA;"
#endif

#if AA_QUALITY == 2 || AA_QUALITY == 3
	"RenderColorTarget=SMAAEdgeMap;  Clear=Color; Pass=SMAAEdgeDetection;"
	"RenderColorTarget=SMAABlendMap; Clear=Color; Pass=SMAABlendingWeightCalculation;"
	"RenderColorTarget=;"
	"RenderDepthStencilTarget=;"
	"Pass=SMAANeighborhoodBlending;"
#endif

#if AA_QUALITY == 4 || AA_QUALITY == 5
	"RenderColorTarget=SMAAEdgeMap;  Clear=Color; Pass=SMAAEdgeDetection1x;"
	"RenderColorTarget=SMAABlendMap; Clear=Color; Pass=SMAABlendingWeightCalculation1x;"
	"RenderColorTarget=ShadingMap; Pass=SMAANeighborhoodBlending;"

	"RenderColorTarget=SMAAEdgeMap;  Clear=Color; Pass=SMAAEdgeDetection2x;"
	"RenderColorTarget=SMAABlendMap; Clear=Color; Pass=SMAABlendingWeightCalculation2x;"
	"RenderColorTarget=;"
	"RenderDepthStencilTarget=;"
	"Pass=SMAANeighborhoodBlendingFinal;"
#endif
;>
{
#if SUN_LIGHT_ENABLE && SUN_SHADOW_QUALITY
	pass ShadowMapGen<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadowMapGenPS();
	}
#if SHADOW_BLUR_COUNT
	pass ShadowBlurX<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadowMapBlurPS(ShadowMapSamp, float2(ViewportOffset2.x, 0.0f));
	}
	pass ShadowBlurY<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadowMapBlurPS(ShadowMapSampTemp, float2(0.0f, ViewportOffset2.y));
	}
#endif
#endif
#if SSDO_QUALITY && (IBL_QUALITY || SUN_LIGHT_ENABLE)
	pass SSDO<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceDirOccPassVS();
		PixelShader  = compile ps_3_0 ScreenSpaceDirOccPassPS();
	}
	pass SSDOBlurX<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ScreenSpaceDirOccBlurPS(SSDOMapSamp, float2(ViewportOffset2.x, 0.0f));
	}
	pass SSDOBlurY<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ScreenSpaceDirOccBlurPS(SSDOMapSampTemp, float2(0.0f, ViewportOffset2.y));
	}
#endif
	pass ShadingOpacity<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadingOpacityPS();
	}
	pass ShadingTransparent<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadingTransparentPS();
	}
#if SSSS_QUALITY
	pass SSSSStencilTest<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		ColorWriteEnable = false;
		StencilEnable = true;
		StencilFunc = ALWAYS;
		StencilRef = 1;
		StencilPass = REPLACE;
		StencilFail = KEEP;
		StencilZFail = KEEP;
		StencilWriteMask = 1;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 SSSSStencilTestPS();
	}
	pass SSSSBlurX<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		StencilEnable = true; StencilFunc = EQUAL; StencilRef = 1; StencilWriteMask = 0;
		VertexShader = compile vs_3_0 SSSGaussBlurVS();
		PixelShader  = compile ps_3_0 SSSGaussBlurPS(ShadingMapTempPointSamp, ShadingMapTempPointSamp, float2(1.0, 0.0));
	}
	pass SSSSBlurY<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		StencilEnable = true; StencilFunc = EQUAL; StencilRef = 1; StencilWriteMask = 0;
		VertexShader = compile vs_3_0 SSSGaussBlurVS();
		PixelShader  = compile ps_3_0 SSSGaussBlurPS(ShadingMapPointSamp, ShadingMapTempPointSamp,float2(0.0, 1.0));
	}
	pass ShadingOpacityAlbedo<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		SrcBlend = DESTCOLOR; DestBlend = ZERO;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadingOpacityAlbedoPS();
	}
	pass ShadingOpacitySpecular<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		SrcBlend = ONE; DestBlend = ONE;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ShadingOpacitySpecularPS();
	}
#endif
#if OUTLINE_QUALITY == 2
	pass EdgeEdgeDetection<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 EdgeEdgeDetectionVS();
		PixelShader  = compile ps_3_0 EdgeLumaEdgeDetectionPS(OutlineMapSamp);
	}
	pass EdgeBlendingWeightCalculation<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 EdgeBlendingWeightCalculationVS();
		PixelShader  = compile ps_3_0 EdgeBlendingWeightCalculationPS(0.0);
	}
	pass EdgeNeighborhoodBlending<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 EdgeNeighborhoodBlendingVS();
		PixelShader  = compile ps_3_0 EdgeNeighborhoodBlendingPS(OutlineMapSamp, ViewportOffset2);
	}
#endif
#if TOON_ENABLE == 2
	pass DiffusionBlurX<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ScreenSpaceBilateralFilterPS(ShadingMapSamp, mDiffusionOffsetX);
	}
	pass DiffusionBlurY<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		SrcBlend = SRCALPHA; DestBlend = INVSRCALPHA;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ScreenSpaceBilateralFilterPS(ShadingMapTempSamp, mDiffusionOffsetY);
	}
#endif
#if SSR_QUALITY
	pass ZBufferMipmap1<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_1_PS(Gbuffer8Map);
	}
	pass ZBufferMipmap2<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap1Samp, kHZBMip2ViewportSize, kHZBMip1ViewportSize);
	}
	pass ZBufferMipmap3<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap2Samp, kHZBMip3ViewportSize, kHZBMip2ViewportSize);
	}
	pass ZBufferMipmap4<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap3Samp, kHZBMip4ViewportSize, kHZBMip3ViewportSize);
	}
	pass ZBufferMipmap5<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap4Samp, kHZBMip5ViewportSize, kHZBMip4ViewportSize);
	}
	pass ZBufferMipmap6<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap5Samp, kHZBMip6ViewportSize, kHZBMip5ViewportSize);
	}
	pass ZBufferMipmap7<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap6Samp, kHZBMip7ViewportSize, kHZBMip6ViewportSize);
	}
	pass ZBufferMipmap8<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap7Samp, kHZBMip8ViewportSize, kHZBMip7ViewportSize);
	}
	pass ZBufferMipmap9<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap8Samp, kHZBMip9ViewportSize, kHZBMip8ViewportSize);
	}
	pass ZBufferMipmap10<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(0);
		PixelShader  = compile ps_3_0 ZBufferMipmap_N_PS(ZBufferMipmap9Samp, kHZBMip10ViewportSize, kHZBMip9ViewportSize);
	}
	pass ZBufferCombine<string Script= "Draw=Buffer;";>{
 		AlphaBlendEnable = false; AlphaTestEnable = false;
 		ZEnable = false; ZWriteEnable = false;
 		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
 		PixelShader  = compile ps_3_0 ZBufferMipmapCombinePS();
 	}
#endif
#if SSR_QUALITY
	pass SSRConeTracing<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 SSRConeTracingPS();
	}
	pass SSRGaussionBlurX1<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX1Samp, SSROffsetX1);
	}
	pass SSRGaussionBlurY1<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX1SampTemp, SSROffsetY1);
	}
	pass SSRGaussionBlurX2<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX1Samp, SSROffsetX2);
	}
	pass SSRGaussionBlurY2<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2.x * 2);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX2SampTemp, SSROffsetY2);
	}
	pass SSRGaussionBlurX3<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2.x * 2);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX2Samp, SSROffsetX3);
	}
	pass SSRGaussionBlurY3<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2.x * 4);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX3SampTemp, SSROffsetY3);
	}
	pass SSRGaussionBlurX4<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2.x * 4);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX3Samp, SSROffsetX4);
	}
	pass SSRGaussionBlurY4<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(ViewportOffset2.x * 8);
		PixelShader  = compile ps_3_0 SSRGaussionBlurPS(SSRLightX4SampTemp, SSROffsetY4);
	}
	pass SSRFinalCombie<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		SrcBlend = ONE; DestBlend = INVSRCALPHA;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 SSRFinalCombiePS();
	}
#endif
#if BOKEH_QUALITY
	pass ComputeFocalDistance<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 ComputeFocalDistancePS(ShadingMapPointSamp);
	}
	pass ComputeDepthBokeh<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ComputeDepthBokehVS();
		PixelShader  = compile ps_3_0 ComputeDepthBokeh4XPS(ShadingMapPointSamp);
	}
	pass ComputeHexBlurFarX<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ComputeHexBlurXVS();
		PixelShader  = compile ps_3_0 ComputeHexBlurXFarPS(FocalBokehMapPointSamp, FocalBokehMapSamp);
	}
	pass ComputeHexBlurFarY<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ComputeHexBlurYVS();
		PixelShader  = compile ps_3_0 ComputeHexBlurYFarPS(FocalBokehMapPointSamp, FocalBlur1MapSamp, FocalBlur2MapSamp);
	}
	pass ComputeBokehFarGather<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ComputeBokehGatherVS();
		PixelShader  = compile ps_3_0 ComputeBokehFarGatherPS(FocalBokehMapSamp, FocalBokehFarMapSamp);
	}
	pass ComputeNearDown<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(1.0 / (ViewportSize * mFocalMapScale));
		PixelShader  = compile ps_3_0 ComputeNearDownPS(FocalBokehTempMapPointSamp, 1.0 / mFocalStepScale);
	}
	pass ComputeSmoothingNearX<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(1.0 / (ViewportSize * mFocalMapScale));
		PixelShader  = compile ps_3_0 ComputeSmoothingNearPS(FocalBokehCoCNearMapSamp, float2(1.0 / mFocalStepScale.x, 0));
	}
	pass ComputeSmoothingNearY<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(1.0 / (ViewportSize * mFocalMapScale));
		PixelShader  = compile ps_3_0 ComputeSmoothingNearPS(FocalBokehTempMapSamp, float2(0, 1.0 / mFocalStepScale.y));
	}
	pass ComputeNearCoC<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(1.0 / (ViewportSize * mFocalMapScale));
		PixelShader  = compile ps_3_0 ComputeNearCoCPS(FocalBokehMapPointSamp, FocalBokehCoCNearMapSamp);
	}
	pass ComputeNearSamllBlur<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(1.0 / (ViewportSize * mFocalMapScale));
		PixelShader  = compile ps_3_0 ComputeNearSamllBlurPS(FocalBokehTempMapSamp, float2(0, 1.0 / mFocalStepScale.y));
	}
	pass ComputeBokehGatherFinal<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		DestBlend = INVSRCALPHA; SrcBlend = SRCALPHA;
		VertexShader = compile vs_3_0 ComputeBokehGatherVS();
		PixelShader  = compile ps_3_0 ComputeBokehGatherFinalPS(FocalBokehMapPointSamp, FocalBokehCoCNearMapSamp, 1.0 / mFocalStepScale);
	}
#endif
#if HDR_EYE_ADAPTATION
	pass EyeLum<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 EyeDownsampleVS(ViewportOffset2);
		PixelShader  = compile ps_3_0 EyeDownsamplePS(ShadingMapPointSamp);
	}
	pass EyeAdapation<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 EyeAdapationPS();
	}
#endif
#if HDR_BLOOM_MODE
	pass GlareDetection<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 GlareDetectionVS();
		PixelShader  = compile ps_3_0 GlareDetectionPS(ShadingMapPointSamp);
	}
#if HDR_STAR_MODE || HDR_FLARE_MODE
	pass HDRDownsample2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 HDRDownsampleVS(ViewportOffset2 * 2);
		PixelShader  = compile ps_3_0 HDRDownsample4XPS(DownsampleSamp1st);
	}
#endif
	pass BloomBlurX1<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset1);
		PixelShader  = compile ps_3_0 BloomBlurPS(DownsampleSamp1st, BloomOffsetX1);
	}
	pass BloomBlurY1<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset1);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp1stTemp, BloomOffsetY1);
	}
	pass BloomDownsampleX2<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 HDRDownsampleVS(BloomOffset1);
		PixelShader  = compile ps_3_0 HDRDownsamplePS(BloomSamp1st);
	}
	pass BloomBlurX2<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset2);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp2nd, BloomOffsetX2);
	}
	pass BloomBlurY2<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset2);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp2ndTemp, BloomOffsetY2);
	}
	pass BloomDownsampleX3<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 HDRDownsampleVS(BloomOffset2);
		PixelShader  = compile ps_3_0 HDRDownsamplePS(BloomSamp2nd);
	}
	pass BloomBlurX3<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset3);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp3rd, BloomOffsetX3);
	}
	pass BloomBlurY3<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset3);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp3rdTemp, BloomOffsetY3);
	}
	pass BloomDownsampleX4<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 HDRDownsampleVS(BloomOffset3);
		PixelShader  = compile ps_3_0 HDRDownsamplePS(BloomSamp3rd);
	}
	pass BloomBlurX4<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset4);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp4th, BloomOffsetX4);
	}
	pass BloomBlurY4<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset4);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp4thTemp, BloomOffsetY4);
	}
	pass BloomDownsampleX5<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 HDRDownsampleVS(BloomOffset4);
		PixelShader  = compile ps_3_0 HDRDownsamplePS(BloomSamp4th);
	}
	pass BloomBlurX5<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset5);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp5th, BloomOffsetX5);
	}
	pass BloomBlurY5<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadOffsetVS(BloomOffset5);
		PixelShader  = compile ps_3_0 BloomBlurPS(BloomSamp5thTemp, BloomOffsetY5);
	}
#if HDR_STAR_MODE == 1 || HDR_STAR_MODE == 2
	pass Star1stStreak1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0), 1);
		PixelShader  = compile ps_3_0 StarStreakPS(DownsampleSamp2nd, star_colorCoeff1st, mBloomStarFade);
	}
	pass Star1stStreak2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0), 4);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp1stTemp, star_colorCoeff2nd, 0);
	}
	pass Star1stStreak3rd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0), 16);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp1st, star_colorCoeff3rd, 0);
	}
	pass Star1stStreak4th<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0), 64);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp1stTemp, star_colorCoeff4th, 0);
	}
	pass Star2ndStreak1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0), 1);
		PixelShader  = compile ps_3_0 StarStreakPS(DownsampleSamp2nd, star_colorCoeff1st, mBloomStarFade);
	}
	pass Star2ndStreak2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0), 4);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp2ndTemp, star_colorCoeff2nd, 0);
	}
	pass Star2ndStreak3rd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0), 16);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp2nd, star_colorCoeff3rd, 0);
	}
	pass Star2ndStreak4th<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0), 64);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp2ndTemp, star_colorCoeff4th, 0);
	}
#endif
#if HDR_STAR_MODE == 3 || HDR_STAR_MODE == 4
	pass Star1stStreak1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0.9), 1);
		PixelShader  = compile ps_3_0 StarStreakPS(DownsampleSamp2nd, star_colorCoeff1st, mBloomStarFade);
	}
	pass Star1stStreak2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0.9), 4);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp1st, star_colorCoeff2nd, 0);
	}
	pass Star1stStreak3rd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, 0.9), 16);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp1stTemp, star_colorCoeff3rd, 0);
	}
	pass Star2ndStreak1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0.9), 1);
		PixelShader  = compile ps_3_0 StarStreakPS(DownsampleSamp2nd, star_colorCoeff1st, mBloomStarFade);
	}
	pass Star2ndStreak2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0.9), 4);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp2nd, star_colorCoeff2nd, 0);
	}
	pass Star2ndStreak3rd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, 0.9), 16);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp2ndTemp, star_colorCoeff3rd, 0);
	}
	pass Star3rdStreak1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, -0.9), 1);
		PixelShader  = compile ps_3_0 StarStreakPS(DownsampleSamp2nd, star_colorCoeff1st, mBloomStarFade);
	}
	pass Star3rdStreak2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, -0.9), 4);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp3rd, star_colorCoeff2nd, 0);
	}
	pass Star3rdStreak3rd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(0.9, -0.9), 16);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp3rdTemp, star_colorCoeff3rd, 0);
	}
	pass Star4thStreak1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, -0.9), 1);
		PixelShader  = compile ps_3_0 StarStreakPS(DownsampleSamp2nd, star_colorCoeff1st, mBloomStarFade);
	}
	pass Star4thStreak2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, -0.9), 4);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp4th, star_colorCoeff2nd, 0);
	}
	pass Star4thStreak3rd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 StarStreakVS(float2(-0.9, -0.9), 16);
		PixelShader  = compile ps_3_0 StarStreakPS(StreakSamp4thTemp, star_colorCoeff3rd, 0);
	}
#endif
#if HDR_FLARE_MODE
	pass GhostImage1st<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 GhostImageVS(ghost_scalar1st);
		PixelShader  = compile ps_3_0 GhostImagePS(DownsampleSamp2nd, BloomSamp2nd, BloomSamp2nd, ghost_modulation1st, mBloomStarFade);
	}
	pass GhostImage2nd<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		SrcBlend = ONE; DestBlend = ONE;
		VertexShader = compile vs_3_0 GhostImageVS(ghost_scalar2nd);
		PixelShader  = compile ps_3_0 GhostImagePS(BloomSamp1stTemp, BloomSamp1stTemp, BloomSamp2nd, ghost_modulation2nd, 0);
	}
#endif
	pass GlareLightComp<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = true; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		SrcBlend = ONE; DestBlend = SRCALPHA;
		VertexShader = compile vs_3_0 GlareLightCompVS();
		PixelShader  = compile ps_3_0 GlareLightCompPS();
	}
#endif
	pass HDRTonemapping<string Script= "Draw=Buffer;";>{
		 AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 HDRTonemappingVS();
		PixelShader  = compile ps_3_0 HDRTonemappingPS(ShadingMapPointSamp);
	}
#if AA_QUALITY == 1
	pass FXAA<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 ScreenSpaceQuadVS();
		PixelShader  = compile ps_3_0 FXAA3(ShadingMapTempSamp, ViewportOffset2);
	}
#endif
#if AA_QUALITY == 2 || AA_QUALITY == 3
	pass SMAAEdgeDetection<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAAEdgeDetectionVS();
		PixelShader  = compile ps_3_0 SMAALumaEdgeDetectionPS(ShadingMapTempSamp);
	}
	pass SMAABlendingWeightCalculation<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAABlendingWeightCalculationVS();
		PixelShader  = compile ps_3_0 SMAABlendingWeightCalculationPS(0.0);
	}
	pass SMAANeighborhoodBlending<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAANeighborhoodBlendingVS();
		PixelShader  = compile ps_3_0 SMAANeighborhoodBlendingPS(ShadingMapTempSamp, true);
	}
#endif
#if AA_QUALITY == 4 || AA_QUALITY == 5
	pass SMAAEdgeDetection1x<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAAEdgeDetectionVS();
		PixelShader  = compile ps_3_0 SMAALumaEdgeDetectionPS(ShadingMapTempSamp);
	}
	pass SMAABlendingWeightCalculation1x<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAABlendingWeightCalculationVS();
		PixelShader  = compile ps_3_0 SMAABlendingWeightCalculationPS(float4(1, 1, 1, 0));
	}
	pass SMAANeighborhoodBlending<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAANeighborhoodBlendingVS();
		PixelShader  = compile ps_3_0 SMAANeighborhoodBlendingPS(ShadingMapTempSamp, false);
	}
	pass SMAAEdgeDetection2x<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAAEdgeDetectionVS();
		PixelShader  = compile ps_3_0 SMAALumaEdgeDetectionPS(ShadingMapSamp);
	}
	pass SMAABlendingWeightCalculation2x<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAABlendingWeightCalculationVS();
		PixelShader  = compile ps_3_0 SMAABlendingWeightCalculationPS(float4(2, 2, 2, 0));
	}
	pass SMAANeighborhoodBlendingFinal<string Script= "Draw=Buffer;";>{
		AlphaBlendEnable = false; AlphaTestEnable = false;
		ZEnable = false; ZWriteEnable = false;
		VertexShader = compile vs_3_0 SMAANeighborhoodBlendingVS();
		PixelShader  = compile ps_3_0 SMAANeighborhoodBlendingPS(ShadingMapSamp, true);
	}
#endif
}