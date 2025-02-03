#define CSM_LAYERED_NUM 2

#define CASTER_ALPHA_ENABLE 1
#define CASTER_ALPHA_MAP_ENABLE 1

const float CasterAlphaThreshold = 0.5;

const float DepthBias = 2.5;
const float NormalBias = 0.5;

#include "../shader/CSM.fxsub"