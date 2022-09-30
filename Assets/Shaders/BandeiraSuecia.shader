Shader "BandeiraSuecia"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}

    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        Pass
        {
            HLSLPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include  "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

                struct Attributes
                {
                    float4 position :POSITION;
                    float2 uv       :TEXCOORD0;
                };

                struct Varyings
                {
                    float4 positionVAR :SV_POSITION;
                    float2 uvVAR       : TEXCOORD0;
                };

                Varyings vert(Attributes Input)
                {
                    Varyings Output;

                    Output.positionVAR = TransformObjectToHClip(Input.position.xyz);
                    Output.uvVAR = Input.uv;

                    //Output.positionVAR = Input.position;

                    return Output;
                }
                float4 frag(Varyings Input) :SV_TARGET
                {
                    float4 color = float4(0,1,0,1);
                    if (Input.uvVAR.y > 0.0) {
                         color = float4(0,0.6,1,1);
                    }
                    if (Input.uvVAR.y > 0.4 && Input.uvVAR.y < 0.6)
                    {
                        color = float4(1, 1, 0, 1);
                    }
                    if (Input.uvVAR.x > 0.3 && Input.uvVAR.x < 0.45) 
                    {
                        color = float4(1, 1, 0, 1);
                    }

                    return color;
                }



            ENDHLSL
        }
    }
}
