import { registerPlugin } from '@capacitor/core';

import type { SecureEncryptionPlugin } from './definitions';

const SecureEncryption = registerPlugin<SecureEncryptionPlugin>('SecureEncryption', {
  web: () => import('./web').then((m) => new m.SecureEncryptionWeb()),
});

export * from './definitions';
export { SecureEncryption };
