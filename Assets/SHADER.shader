// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Custom/SHADER"
{
	Properties
	{
		_Shirt("Shirt", 2D) = "white" {}
		_Socks("Socks", 2D) = "white" {}
		_Shorts("Shorts", 2D) = "white" {}
		_ColorA("Color A", Color) = (0,0,0,0)
		_ColorB("Color B", Color) = (0,0,0,0)
		_ColorC("Color C", Color) = (0,0,0,0)
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

		uniform float4 _ColorA;
		uniform sampler2D _Shirt;
		uniform float4 _Shirt_ST;
		uniform float4 _ColorB;
		uniform float4 _ColorC;
		uniform sampler2D _Shorts;
		uniform float4 _Shorts_ST;
		uniform sampler2D _Socks;
		uniform float4 _Socks_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ColorA32 = _ColorA;
			float2 uv_Shirt = i.uv_texcoord * _Shirt_ST.xy + _Shirt_ST.zw;
			float4 break23_g3 = tex2D( _Shirt, uv_Shirt );
			float textureX45_g3 = break23_g3.x;
			float4 filterR49_g3 = saturate( ( ColorA32 + ( 1.0 - textureX45_g3 ) ) );
			float4 ColorB31 = _ColorB;
			float textureY46_g3 = break23_g3.y;
			float4 filterG54_g3 = saturate( ( ColorB31 + ( 1.0 - textureY46_g3 ) ) );
			float4 ColorC27 = _ColorC;
			float textureZ47_g3 = break23_g3.z;
			float4 filterB58_g3 = saturate( ( ColorC27 + ( 1.0 - textureZ47_g3 ) ) );
			float4 Red42 = ( ( filterR49_g3 * filterG54_g3 * filterB58_g3 ) * i.vertexColor.r );
			float2 uv_Shorts = i.uv_texcoord * _Shorts_ST.xy + _Shorts_ST.zw;
			float4 break23_g2 = tex2D( _Shorts, uv_Shorts );
			float textureX45_g2 = break23_g2.x;
			float4 filterR49_g2 = saturate( ( ColorA32 + ( 1.0 - textureX45_g2 ) ) );
			float textureY46_g2 = break23_g2.y;
			float4 filterG54_g2 = saturate( ( ColorB31 + ( 1.0 - textureY46_g2 ) ) );
			float textureZ47_g2 = break23_g2.z;
			float4 filterB58_g2 = saturate( ( ColorC27 + ( 1.0 - textureZ47_g2 ) ) );
			float4 Green38 = ( ( filterR49_g2 * filterG54_g2 * filterB58_g2 ) * i.vertexColor.g );
			float2 uv_Socks = i.uv_texcoord * _Socks_ST.xy + _Socks_ST.zw;
			float4 break23_g1 = tex2D( _Socks, uv_Socks );
			float textureX45_g1 = break23_g1.x;
			float4 filterR49_g1 = saturate( ( ColorA32 + ( 1.0 - textureX45_g1 ) ) );
			float textureY46_g1 = break23_g1.y;
			float4 filterG54_g1 = saturate( ( ColorB31 + ( 1.0 - textureY46_g1 ) ) );
			float textureZ47_g1 = break23_g1.z;
			float4 filterB58_g1 = saturate( ( ColorC27 + ( 1.0 - textureZ47_g1 ) ) );
			float4 Blue39 = ( ( filterR49_g1 * filterG54_g1 * filterB58_g1 ) * i.vertexColor.b );
			o.Albedo = saturate( ( Red42 + Green38 + Blue39 ) ).xyz;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
126;182;1903;729;1744.401;889.8027;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;33;-1750.503,-795.7742;Float;False;299.5476;829.8729;Color Declaration;6;26;25;31;22;32;27;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;26;-1698.357,-250.5845;Float;False;Property;_ColorC;Color C;7;0;Create;True;0;0;False;0;0,0,0,0;0,0,0.4309064,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;25;-1690.64,-496.1023;Float;False;Property;_ColorB;Color B;6;0;Create;True;0;0;False;0;0,0,0,0;0.3219416,0.5943537,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;22;-1691.185,-745.7742;Float;False;Property;_ColorA;Color A;5;0;Create;True;0;0;False;0;0,0,0,0;0.5646359,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;19;-1377.936,400.9777;Float;False;900.6089;616.9773;Green;7;38;64;28;35;4;16;59;;0,1,0.05769157,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;32;-1696.685,-577.6363;Float;False;ColorA;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;31;-1693.956,-331.8428;Float;False;ColorB;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;27;-1700.503,-80.90153;Float;False;ColorC;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;18;-1385.568,-861.2664;Float;False;901.1027;607.3334;Red;7;42;65;41;36;67;30;2;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-1376.899,-218.5767;Float;False;894.3408;588.7142;Blue;7;39;63;3;29;34;14;58;;0,0.07741523,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;2;-1347.942,-618.1404;Float;True;Property;_Shirt;Shirt;0;0;Create;True;0;0;False;0;None;29f0c00477cd9004386b95c124015347;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-1353.767,12.37321;Float;True;Property;_Socks;Socks;3;0;Create;True;0;0;False;0;None;29f0c00477cd9004386b95c124015347;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;29;-1004.712,-34.4991;Float;False;27;ColorC;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;14;-1010.97,201.8176;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;36;-1051.027,-818.6782;Float;False;32;ColorA;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;16;-1038.089,813.6555;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;58;-1004.88,-174.0682;Float;False;32;ColorA;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;4;-1360.277,625.9503;Float;True;Property;_Shorts;Shorts;4;0;Create;True;0;0;False;0;None;29f0c00477cd9004386b95c124015347;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;28;-1030.424,595.2654;Float;False;27;ColorC;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;67;-1049.401,-744.8027;Float;False;31;ColorB;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;35;-1027.35,517.5262;Float;False;31;ColorB;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;59;-1035.098,434.519;Float;False;32;ColorA;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;30;-1042.567,-668.6243;Float;False;27;ColorC;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;41;-1038.533,-426.1937;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;34;-1010.846,-104.4368;Float;False;31;ColorB;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;63;-997.1924,36.70915;Float;False;LerpRGB;1;;1;94d4cac60f6f1bd4e892b7050d48710c;0;5;21;FLOAT4;0,0,0,0;False;22;FLOAT4;0,0,0,0;False;24;FLOAT4;0,0,0,0;False;19;FLOAT;0;False;5;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;65;-1028.974,-590.925;Float;False;LerpRGB;1;;3;94d4cac60f6f1bd4e892b7050d48710c;0;5;21;FLOAT4;0,0,0,0;False;22;FLOAT4;0,0,0,0;False;24;FLOAT4;0,0,0,0;False;19;FLOAT;0;False;5;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;64;-1042.731,662.2502;Float;False;LerpRGB;1;;2;94d4cac60f6f1bd4e892b7050d48710c;0;5;21;FLOAT4;0,0,0,0;False;22;FLOAT4;0,0,0,0;False;24;FLOAT4;0,0,0,0;False;19;FLOAT;0;False;5;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;38;-697.8273,669.7046;Float;False;Green;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-692.4067,-644.5115;Float;False;Red;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;66;-433.7934,-785.1005;Float;False;462.265;797.449;Output;6;44;43;45;9;10;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-733.5856,-22.75544;Float;False;Blue;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;45;-380.9487,-580.0732;Float;False;39;Blue;1;0;OBJECT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-383.7934,-735.1005;Float;False;42;Red;1;0;OBJECT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-380.9487,-656.8757;Float;False;38;Green;1;0;OBJECT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-164.6902,-674.3118;Float;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode;10;-184.4405,-533.6429;Float;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-234.5283,-442.6516;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Custom/SHADER;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;32;0;22;0
WireConnection;31;0;25;0
WireConnection;27;0;26;0
WireConnection;63;21;58;0
WireConnection;63;22;34;0
WireConnection;63;24;29;0
WireConnection;63;19;14;3
WireConnection;63;5;3;0
WireConnection;65;21;36;0
WireConnection;65;22;67;0
WireConnection;65;24;30;0
WireConnection;65;19;41;1
WireConnection;65;5;2;0
WireConnection;64;21;59;0
WireConnection;64;22;35;0
WireConnection;64;24;28;0
WireConnection;64;19;16;2
WireConnection;64;5;4;0
WireConnection;38;0;64;0
WireConnection;42;0;65;0
WireConnection;39;0;63;0
WireConnection;9;0;43;0
WireConnection;9;1;44;0
WireConnection;9;2;45;0
WireConnection;10;0;9;0
WireConnection;0;0;10;0
ASEEND*/
//CHKSM=6D96E2D11F6702E8C5164338F691C1ABC30C4E03