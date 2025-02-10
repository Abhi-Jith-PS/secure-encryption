export interface SecureEncryptionPlugin {
  encrypt(options: { plaintext: string }): Promise<{ ciphertext: string }>;
  decrypt(options: { ciphertext: string }): Promise<{ plaintext: string }>;
  generateKey(): Promise<{ success: boolean }>;  // Ensure this is defined
}
