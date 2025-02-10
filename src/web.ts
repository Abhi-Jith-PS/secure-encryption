import { WebPlugin } from '@capacitor/core';

import type { SecureEncryptionPlugin } from './definitions';

export class SecureEncryptionWeb extends WebPlugin implements SecureEncryptionPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
