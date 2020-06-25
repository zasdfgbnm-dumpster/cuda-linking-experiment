template<long long i>
__global__ void add_kernel(float *a, float *b, float *c, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        c[idx] = a[idx] + b[idx];
    }
}

template<long long l = 0, long long r = 1000>
void _add(float *a, float *b, float *c, int N) {
    if constexpr (l == r) {
        add_kernel<l><<<(N + 255) / 256, 256>>>(a, b, c, N);
    } else if constexpr (l + 1 == r) {
        add_kernel<l><<<(N + 255) / 256, 256>>>(a, b, c, N);
        add_kernel<r><<<(N + 255) / 256, 256>>>(a, b, c, N);
    } else {
        constexpr long long m = (l + r) / 2;
        _add<l, m>(a, b, c, N);
        _add<m, r>(a, b, c, N);
    }
}

void add(float *a, float *b, float *c, int N) {
    _add(a, b, c, N);
}
