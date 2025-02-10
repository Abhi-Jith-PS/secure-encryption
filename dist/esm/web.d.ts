import { WebPlugin } from '@capacitor/core';
import type { SecureEncryptionPlugin } from './definitions';
export declare class SecureEncryptionWeb extends WebPlugin implements SecureEncryptionPlugin {
    private secretKey;
    encrypt(options: {
        plaintext: string;
    }): Promise<{
        ciphertext: string;
    }>;
    decrypt(options: {
        ciphertext: string;
    }): Promise<{
        plaintext: string;
    }>;
    generateKey(): Promise<{
        success: boolean;
    }>;
}
