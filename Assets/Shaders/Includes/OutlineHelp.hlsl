SAMPLER(sampler_point_clamp);

void GetDepth_float(float2 uv, out float Depth)
{
    Depth = SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv);
}


void GetNormal_float(float2 uv, out float3 Normal)
{
    Normal = SAMPLE_TEXTURE2D(_NormalsBuffer, sampler_point_clamp, uv).rgb;
}

void GetBloom_float(float2 uv, out float3 Bloom)
{
	Bloom = SAMPLE_TEXTURE2D(_BloomBuffer, sampler_point_clamp, uv).rgb;
}

// Code from https://www.youtube.com/watch?v=LMqio9NsqmM
void GetCrossSampleUVs_float(
    float4 UV,
    float2 TexelSize,
    float OffsetMultiplier,
    out float2 UVOriginal,
    out float2 UVTopRight,
    out float2 UVBottomLeft,
    out float2 UVTopLeft,
    out float2 UVBottomRight
) {
    UVOriginal = UV;
	UVTopRight = UV.xy + float2(TexelSize.x, TexelSize.y) * OffsetMultiplier;
	UVBottomLeft = UV.xy - float2(TexelSize.x, TexelSize.y) * OffsetMultiplier;
	UVTopLeft = UV.xy + float2(-TexelSize.x, TexelSize.y) * OffsetMultiplier;
	UVBottomRight = UV.xy + float2(TexelSize.x, -TexelSize.y) * OffsetMultiplier;
}