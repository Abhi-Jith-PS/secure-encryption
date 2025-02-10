import { registerPlugin } from '@capacitor/core';
const SecureEncryption = registerPlugin('SecureEncryption', {
    web: () => import('./web').then(m => new m.SecureEncryptionWeb()),
});
export default SecureEncryption;
//# sourceMappingURL=index.js.map