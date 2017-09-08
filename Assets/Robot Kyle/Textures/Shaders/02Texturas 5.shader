
// Directorio /Nombre del shader
Shader "Custom/BaseTexturas/TexturaEnMovimientoPeriodico" {

	// Variables disponibles en el inspector (Propiedades)
	Properties{
		//Se crea una propiedad tipo textura
		_TexturaMovimiento("Textura movimiento", 2D) = "white" {}
		_Color("Color principal",Color)=(1,1,1,1)

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

	
	// Información adicional provista por el juego
	struct Input {
		//Siempre: uv_ + nombre de la textura
		float2 uv_TexturaMovimiento;
	
	};

	// Nucleo del programa
	void surf(Input IN, inout SurfaceOutputStandard o) {
	float2 UVmovimiento=IN.uv_TexturaMovimiento;
	float A=1.2;
	float w=1.2;
	float distanciaX=(A*sin(w*-_Time.y));
	float distanciaY=(A*sin(w*-_Time.y));
	UVmovimiento += float2(distanciaX,distanciaY);
	float4 c=tex2D(_TexturaMovimiento,UVmovimiento);
	c *=_Color;
	
	 	
		o.Albedo = c.rgb;
	}
	ENDCG
	}

	FallBack "Diffuse"
}
