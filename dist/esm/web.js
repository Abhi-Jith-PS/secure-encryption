import { WebPlugin } from '@capacitor/core';
export class SecureEncryptionWeb extends WebPlugin {
    constructor() {
        super(...arguments);
        this.secretKey = new TextEncoder().encode('6w9z$C&F)J@NcRfU');
    }
    async encrypt(options) {
        const iv = crypto.getRandomValues(new Uint8Array(12));
        const key = await crypto.subtle.importKey('raw', this.secretKey, { name: 'AES-GCM' }, false, ['encrypt']);
        const encrypted = await crypto.subtle.encrypt({ name: 'AES-GCM', iv }, key, new TextEncoder().encode(options.plaintext));
        return { ciphertext: `${btoa(String.fromCharCode(...iv))}:${btoa(String.fromCharCode(...new Uint8Array(encrypted)))}` };
    }
    async decrypt(options) {
        const parts = options.ciphertext.split(':');
        const iv = new Uint8Array(atob(parts[0]).split('').map(c => c.charCodeAt(0)));
        const encryptedData = new Uint8Array(atob(parts[1]).split('').map(c => c.charCodeAt(0)));
        const key = await crypto.subtle.importKey('raw', this.secretKey, { name: 'AES-GCM' }, false, ['decrypt']);
        const decrypted = await crypto.subtle.decrypt({ name: 'AES-GCM', iv }, key, encryptedData);
        return { plaintext: new TextDecoder().decode(decrypted) };
    }
    async generateKey() {
        // No-op since we are using a static key
        return { success: true };
    }
}
//# sourceMappingURL=web.js.map