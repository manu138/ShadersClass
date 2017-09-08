
// Directorio /Nombre del shader
Shader "Custom/BaseTexturas/MultiMascara" {

	// Variables disponibles en el inspector (Propiedades)
	Properties{
		//Se crea una propiedad tipo textura
		_Textura("Textura (RGB)", 2D) = "white" {}
		_Textura2("Textura2 (RGB)", 2D) = "white" {}
		_Textura3("Textura3 (RGB)", 2D) = "white" {}
		_Textura4("Textura4 (RGB)", 2D) = "white" {}
		
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
	sampler2D _Textura4;
	
	// Información adicional provista por el juego
	struct Input {
		//Siempre: uv_ + nombre de la textura
		float2 uv_Textura;
		float2 uv_Textura2;
		float2 uv_Textura3;
		float2 uv_Textura4;
	};

	// Nucleo del programa
	void surf(Input IN, inout SurfaceOutputStandard o) {
		float4 t1 = tex2D(_Textura, IN.uv_Textura);
		float4 t2=tex2D(_Textura2, IN.uv_Textura2);
		float4 t3=tex2D(_Textura3, IN.uv_Textura3);
		float4 t4=tex2D(_Textura4, IN.uv_Textura4);

		float4 resultado =(t2*t1.r)+(t3*t1.g)+(t4*t1.b);
	 
	 	
		o.Albedo = resultado.rgb;
	}
	ENDCG
	}

	FallBack "Diffuse"
}
