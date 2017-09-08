
// Directorio /Nombre del shader
Shader "Custom/ShaderBordes" {

	// Variables disponibles en el inspector (Propiedades)
	Properties{
		//Se crea una propiedad tipo textura
		_Textura("Textura (RGB)", 2D) = "white" {}
		_Textura2("Textura2 (RGB)", 2D) = "white" {}
		_Color ("Color", Color) = (1,1,1,1)
		_range("Range",Range(0,1))=0
	}

	SubShader{
	Tags{ "RenderType" = "Opaque" }
	LOD 200

	CGPROGRAM
	// Método para el cálculo de la luz
	#pragma surface surf Standard fullforwardshadows
	#pragma target 3.0

	// Declaración de variables
	sampler2D _Textura;
	sampler2D _Textura2;
	float4 _Color;
	float _range;
	// Información adicional provista por el juego
	struct Input {
		//Siempre: uv_ + nombre de la textura
		float2 uv_Textura;
		float2 uv_Textura2;
		float3 worldNormal;
		float3 viewDir;
	};

	// Nucleo del programa
	void surf(Input IN, inout SurfaceOutputStandard o) {
	float bordes= dot(IN.worldNormal,IN.viewDir);
	float bordes2=dot(IN.worldNormal,IN.viewDir);
	float4 c2=tex2D(_Textura, IN.uv_Textura);

	bordes=abs(bordes);
	bordes2=abs(bordes2);
		if(bordes < _range)
		{
		bordes=0;
		}
		else{
		bordes=1;
		}
		if(bordes2 < 0.35)
		{
		bordes2=1;
		}
		else{
		bordes2=0;
		}

		float4 c3=bordes*c2;
		float4 c= (1-bordes)*_Color;
		c3=c + c3;
	
		o.Albedo = c3.rgb;
	}
	ENDCG
	}

	FallBack "Diffuse"
}