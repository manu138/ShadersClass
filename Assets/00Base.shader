// Directorio /Nombre del shader
Shader "Custom/Base" {

	// Variables disponibles en el inspector (Propiedades)
	Properties { 
		_Range("Factor",Range(0,1))=0
		_Color1("Color 1",Color)=(1,1,1,1)
		_Color2("Color 2",Color)=(1,1,1,1)
	}

	// Primer subshader
	SubShader { 
		LOD 200
		
		CGPROGRAM
		// Método para el cálculo de la luz
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		// Información adicional provista por el juego
		struct Input {
			float2 uv_MainTex;
		};

		// Declaración de variables
		float _Range;
		float4 _Color1;
		float4 _Color2;
		float4 _ColorResultado;

		// Nucleo del programa
		void surf (Input IN, inout SurfaceOutputStandard o) {

			
			_Color1 = 1*_Range;

			 _Color2 =-1*_Range;  
			_ColorResultado= _Color1 + _Color2;

			float4 c = _ColorResultado;
			o.Albedo = c.rgb;

		}
		ENDCG

	}// Final del primer subshader

	// Segundo subshader si existe alguno
	// Tercer subshader...

	// Si no es posible ejecutar ningún subshader ejecute Diffuse
	FallBack "Diffuse"
}
