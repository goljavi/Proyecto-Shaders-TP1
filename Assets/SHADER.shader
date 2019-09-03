// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Custom/SHADER"
{
	Properties
	{
		_Shirt("Shirt", 2D) = "white" {}
		_Socks("Socks", 2D) = "white" {}
		_Shorts("Shorts", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _Shirt;
		uniform float4 _Shirt_ST;
		uniform sampler2D _Socks;
		uniform float4 _Socks_ST;
		uniform sampler2D _Shorts;
		uniform float4 _Shorts_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color11 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float2 uv_Shirt = i.uv_texcoord * _Shirt_ST.xy + _Shirt_ST.zw;
			float4 temp_cast_0 = (tex2D( _Shirt, uv_Shirt ).r).xxxx;
			float4 lerpResult5 = lerp( color11 , temp_cast_0 , i.vertexColor.r);
			float2 uv_Socks = i.uv_texcoord * _Socks_ST.xy + _Socks_ST.zw;
			float4 temp_cast_1 = (tex2D( _Socks, uv_Socks ).r).xxxx;
			float4 color12 = IsGammaSpace() ? float4(0.9528302,0.3011303,0.3011303,0) : float4(0.8960326,0.07379985,0.07379985,0);
			float4 lerpResult8 = lerp( temp_cast_1 , color12 , i.vertexColor.b);
			float2 uv_Shorts = i.uv_texcoord * _Shorts_ST.xy + _Shorts_ST.zw;
			float4 temp_cast_2 = (tex2D( _Shorts, uv_Shorts ).r).xxxx;
			float4 color15 = IsGammaSpace() ? float4(0.3290542,1,0.08018869,0) : float4(0.08845779,1,0.007218568,0);
			float4 lerpResult6 = lerp( temp_cast_2 , color15 , i.vertexColor.g);
			o.Albedo = saturate( ( lerpResult5 + lerpResult8 + lerpResult6 ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
841;213;1325;581;1493.215;251.5602;1.482253;True;True
Node;AmplifyShaderEditor.CommentaryNode;19;-1079.453,582.1868;Float;False;691.0203;691.1793;Green;4;4;15;16;6;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;18;-1070.982,-736.8375;Float;False;608.7044;608.695;Red;4;2;13;11;5;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-1106.451,-62.72534;Float;False;675.6814;586.057;Blue. El alpha del lerp tiene que ser la textura de socks. El vetex color es otro lerp que se tiene que aplicar aparte;4;14;3;12;8;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;2;-1020.982,-404.3476;Float;True;Property;_Shirt;Shirt;0;0;Create;True;0;0;False;0;None;9b1ee065d25077c4da25ca5e0f0844ab;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;16;-608.3671,990.5184;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;14;-650.6253,321.3316;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;11;-704.8027,-686.8375;Float;False;Constant;_Color0;Color 0;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-1056.451,142.7579;Float;True;Property;_Socks;Socks;1;0;Create;True;0;0;False;0;None;09f0a3ea5eb13164785d4097813eb688;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1029.453,706.4844;Float;True;Property;_Shorts;Shorts;2;0;Create;True;0;0;False;0;None;9b1ee065d25077c4da25ca5e0f0844ab;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;15;-639.4329,632.1868;Float;False;Constant;_Color2;Color 2;3;0;Create;True;0;0;False;0;0.3290542,1,0.08018869,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;13;-665.2776,-330.1425;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;12;-685.7697,-12.72534;Float;False;Constant;_Color1;Color 1;3;0;Create;True;0;0;False;0;0.9528302,0.3011303,0.3011303,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;8;-654.4837,176.4403;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;5;-678.3976,-494.4291;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;6;-620.5608,827.319;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-317.2468,145.7801;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;10;-171.4993,146.7815;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;4.295003,148.3147;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Custom/SHADER;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;3;1
WireConnection;8;1;12;0
WireConnection;8;2;14;3
WireConnection;5;0;11;0
WireConnection;5;1;2;1
WireConnection;5;2;13;1
WireConnection;6;0;4;1
WireConnection;6;1;15;0
WireConnection;6;2;16;2
WireConnection;9;0;5;0
WireConnection;9;1;8;0
WireConnection;9;2;6;0
WireConnection;10;0;9;0
WireConnection;0;0;10;0
ASEEND*/
//CHKSM=880C33D6BF56A238864C238EBFAEE3016A6EE1ED