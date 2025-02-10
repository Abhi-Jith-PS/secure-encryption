# @aspire/secure-encryption

This custom plugin is created for internal use only within Aspire. Redistribution, modification, and distribution are not permitted without prior approval.

## Install

```bash
npm install @aspire/secure-encryption
npx cap sync
```

## API

<docgen-index>

* [`encrypt(...)`](#encrypt)
* [`decrypt(...)`](#decrypt)
* [`generateKey()`](#generatekey)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### encrypt(...)

```typescript
encrypt(options: { plaintext: string; }) => Promise<{ ciphertext: string; }>
```

| Param         | Type                                |
| ------------- | ----------------------------------- |
| **`options`** | <code>{ plaintext: string; }</code> |

**Returns:** <code>Promise&lt;{ ciphertext: string; }&gt;</code>

--------------------


### decrypt(...)

```typescript
decrypt(options: { ciphertext: string; }) => Promise<{ plaintext: string; }>
```

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ ciphertext: string; }</code> |

**Returns:** <code>Promise&lt;{ plaintext: string; }&gt;</code>

--------------------


### generateKey()

```typescript
generateKey() => Promise<{ success: boolean; }>
```

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------

</docgen-api>
