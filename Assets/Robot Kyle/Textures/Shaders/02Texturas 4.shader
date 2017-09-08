
// Directorio /Nombre del shader
Shader "Custom/BaseTexturas/TexturaEnMovimiento" {

	// Variables disponibles en el inspector (Propiedades)
	Properties{
		//Se crea una propiedad tipo textura
		_TexturaMovimiento("Textura movimiento", 2D) = "white" {}
		_Color("Color principal",Color)=(1,1,1,1)
		_rangex("Rangex",Range(-1,1))=0
		_rangey("Rangey",Range(-1,1))=0
	}

	SubShader{
	Tags{ "RenderType" = "Opaque" }
	LOD 200

	CGPROGRAM
	// Método para el cálculo de la luz
	#pragma surface surf Standard fullforwardshadows
	#pragma target 3.0

	// Declaración de variables
	sampler2D _TexturaMovimiento;
	float4 _Color;
	float _rangex;
	float _rangey;
	
	// Información adicional provista por el juego
	struct Input {
		//Siempre: uv_ + nombre de la textura
		float2 uv_TexturaMovimiento;
	
	};

	// Nucleo del programa
	void surf(Input IN, inout SurfaceOutputStandard o) {
	float2 UVmovimiento=IN.uv_TexturaMovimiento;

	float distanciaX=_rangex*_Time.y;
	float distanciaY=_rangey* _Time.y;
	UVmovimiento += float2(distanciaX,distanciaY);
	float4 c=tex2D(_TexturaMovimiento,UVmovimiento);
	c *=_Color;
	
	 	
		o.Albedo = c.rgb;
	}
	ENDCG
	}

	FallBack "Diffuse"
}
