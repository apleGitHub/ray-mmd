//遮罩
//纯黑 意味关闭（不被照亮）




//透明阈值
float alphaThr = 0.65;
//遮罩强度
float maskThr = 0.0;


float4x4 WorldViewProjMatrix      : WORLDVIEWPROJECTION;
float4x4 WorldMatrix              : WORLD;
float4x4 WorldViewMatrix          : WORLDVIEW;
float4x4 ViewMatrix               : VIEW;
float4x4 ProjMatrix               : PROJECTION;
float4x4 LightWorldViewProjMatrix : WORLDVIEWPROJECTION < string Object = "Light"; >;


float3 CameraDrection			  : DIRECTION < string Object = "Camera"; >;
float4 Diffuse 			  		  : DIFFUSE < string Object = "Geometry"; >;

float2 ScreenSize 				  : VIEWPORTPIXELSIZE;


texture matTexture: MATERIALTEXTURE;

sampler matTextureSamp = sampler_state
{
    texture = <matTexture>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    MIPFILTER = LINEAR;
    ADDRESSU  = WRAP;
    ADDRESSV  = WRAP;
};

struct VS_OUTPUT
{
	float4 Pos : POSITION;
	float3 Normal : TEXCOORD0;
	float4 Dep : TEXCOORD1;
	float2 TexCoord : TEXCOORD2;
};


VS_OUTPUT Basic_VS( float4 Pos : POSITION, float3 Normal : NORMAL, float2 Tex : TEXCOORD0) 
{
	//float4 Pos0 = Pos; 
	
	Pos = mul( Pos, WorldViewMatrix );
	Pos = mul( Pos, ProjMatrix );
	
	float3 normal = normalize( mul( Normal, (float3x3)WorldViewMatrix ) );
	//float3 normal = normalize( mul( Normal, (float3x3)WorldViewMatrix ) );
	//float3 Eye = CameraPosition - mul( Pos0, WorldMatrix );
	
	//float3 normal2 = ( normal + 1.0f ) / 2.0f;
	//Pos.x = Pos.x + normal.x / 3;
	//Pos.y = Pos.y - normal.y / 3;
	
	float4 Dep = Pos;
	
	
	//Pos.x = Pos.x - normal.x * 0.05; Pos.y = Pos.y - normal.y * 0.05; //Pos.z = Pos.z - normal.z * 0.06;
	
	//VS_OUTPUT Out = { Pos, normal2, Dep};
	VS_OUTPUT Out = { Pos, normal, Dep, Tex};
	
	return Out;
}

float4 Basic_PS(VS_OUTPUT IN, float2 Tex: TEXCOORD0, uniform bool useTex) : COLOR0
{
	
	//IN.Pos.x *= 1;
	
	//Tex.x *= 2;
	
	//float depth = IN.Dep.z / IN.Dep.w ;		//空间深度信息 一会放在r通道
	
	//float cutting = 0 ;						//视角剪影黑色 放在g通道！
	
	//float offect = 0;
	
	float alpha = Diffuse.a;
	
	if(useTex)
	{
		alpha = alpha * tex2D(matTextureSamp, IN.TexCoord).a;
	}
    
    if(alpha > alphaThr)
	{
		alpha = 1;
	}
	else
	{
		alpha = 0;
	}
	
	float4 Color = float4( maskThr, maskThr, maskThr, alpha);
	
	
	//float3 normal = IN.Normal.xyz ;
	
	//float4 Color = tex2D( DepSamp, Tex );
	
	//Color = float4(0,0,0,1);
	
	return Color;
    //return float4(depth , depth, depth, 1 );
	//return float4(normal.x, normal.y, normal.z ,1);
}


technique MainTec < string MMDPass = "object"; bool UseTexture = false;> {
    pass DrawObject {
		AlphaBlendEnable = FALSE;
        VertexShader = compile vs_2_0 Basic_VS();
        PixelShader  = compile ps_2_0 Basic_PS(false);
    }
}

technique MainTec_ss < string MMDPass = "object_ss"; bool UseTexture = false;> {
    pass DrawObject {
		AlphaBlendEnable = FALSE;
        VertexShader = compile vs_2_0 Basic_VS();
        PixelShader  = compile ps_2_0 Basic_PS(false);
    }
}

technique MainTexTec < string MMDPass = "object"; bool UseTexture = true;> {
    pass DrawObject {
        VertexShader = compile vs_2_0 Basic_VS();
        PixelShader  = compile ps_2_0 Basic_PS(true);
    }
}

technique MainTexTec_ss < string MMDPass = "object_ss"; bool UseTexture = true;> {
    pass DrawObject {
        VertexShader = compile vs_2_0 Basic_VS();
        PixelShader  = compile ps_2_0 Basic_PS(true);
    }
}

technique ShadowTec < string MMDPass = "shadow"; > { }

technique EdgeDepthTec < string MMDPass = "edge"; > { }