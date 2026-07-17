export function removePrefix(prefix: string, value: string): string {
    return prefixRemover(prefix)(value);
}

export function prefixRemover(prefix: string): (value: string) => string {
    const prefixLength = prefix.length
    return (value: string) => {
        if (!value.startsWith(prefix)) return value;
        return value.slice(prefixLength);
    }
}