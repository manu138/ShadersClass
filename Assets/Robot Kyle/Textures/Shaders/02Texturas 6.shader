
// Directorio /Nombre del shader
Shader "Custom/BaseTexturas/NormalConfuerza" {

	// Variables disponibles en el inspector (Propiedades)
	Properties{
		//Se crea una propiedad tipo textura
		_Textura("Textura movimiento", 2D) = "white" {}
	
		_Normal("normal map",2D)="white" {}
		_Fuerza("Fuerza",Range(0.1,2))=0
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
	sampler2D _Normal;
	float _Fuerza;

	
	// Información adicional provista por el juego
	struct Input {
		//Siempre: uv_ + nombre de la textura
		float2 uv_Textura;
		float2 uv_Normal;
	
	};

	// Nucleo del programa
	void surf(Input IN, inout SurfaceOutputStandard o) {

	float4 c= tex2D(_Textura,IN.uv_Textura);
		
	o.Albedo = c.rgb;

	float4 n = tex2D(_Normal,IN.uv_Normal);
	
	float3 normal= UnpackNormal(n).rgb;
	normal.r = normal.r * _Fuerza;
	normal.g = normal.g * _Fuerza;

	o.Normal = normalize(normal);


	
	
	}
	ENDCG
	}

	FallBack "Diffuse"
}
