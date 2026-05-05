// Stub implementations cho iOS Simulator
// Các hàm OpenSSL này không có simulator slice trong libcrypto.a gốc
// Chúng sẽ không bao giờ được gọi trên Simulator vì BLE không hoạt động

#include <stdlib.h>
#include <string.h>

// --- BN (Big Number) stubs ---
void *BN_new(void) { return NULL; }
void BN_free(void *a) {}
int BN_set_word(void *a, unsigned long w) { return 0; }
void *BN_bin2bn(const unsigned char *s, int len, void *ret) { return NULL; }
int BN_bn2bin(const void *a, unsigned char *to) { return 0; }
int BN_num_bytes(const void *a) { return 0; }

// --- DH (Diffie-Hellman) stubs ---
void *DH_new(void) { return NULL; }
void DH_free(void *dh) {}
int DH_generate_key(void *dh) { return 0; }
int DH_compute_key(unsigned char *key, const void *pub_key, void *dh) { return -1; }
int DH_size(const void *dh) { return 0; }
int DH_set0_pqg(void *dh, void *p, void *q, void *g) { return 0; }
void DH_get0_pub_key(const void *dh, const void **pub_key, const void **priv_key) {}
void DH_get0_priv_key(const void *dh, const void **pub_key, const void **priv_key) {}
int DH_check_pub_key(const void *dh, const void *pub_key, int *codes) { return 0; }
