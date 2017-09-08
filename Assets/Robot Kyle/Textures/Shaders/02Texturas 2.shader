
// Directorio /Nombre del shader
Shader "Custom/BaseTexturas/MascaraTextura" {

	// Variables disponibles en el inspector (Propiedades)
	Properties{
		//Se crea una propiedad tipo textura
		_Textura("Textura (RGB)", 2D) = "white" {}
		_Textura2("Textura2 (RGB)", 2D) = "white" {}
		_Textura3("Textura3 (RGB)", 2D) = "white" {}
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
	sampler2D _Textura3;
	float4 _Color;
	float _range;
	// Información adicional provista por el juego
	struct Input {
		//Siempre: uv_ + nombre de la textura
		float2 uv_Textura;
		float2 uv_Textura2;
		float2 uv_Textura3;
	};

	// Nucleo del programa
	void surf(Input IN, inout SurfaceOutputStandard o) {
		float4 c = tex2D(_Textura, IN.uv_Textura);
		float4 mascara=tex2D(_Textura2, IN.uv_Textura);
		float4 resultado=tex2D(_Textura3, IN.uv_Textura3);

		float4 c3=c*(1-mascara);
		float4 c4=mascara*resultado;
		c3=c3 + c4;
		o.Albedo = c3.rgb;
	}
	ENDCG
	}

	FallBack "Diffuse"
}
