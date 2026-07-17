type LogLine = { level: 'log' | 'error', data: any[] }
export class Logger {
    private logLines: Array<LogLine> = [];
    log(...data: any[]): void {
        this.logLines.push({ level: 'log', data });
        console.log(...data);
    }
    error(...data: any[]): void {
        this.logLines.push({ level: 'error', data });
        console.error(...data);
    }

    async writeTo(file: string) {
        const writer = Bun.file(file).writer();
        for (const logLine of this.logLines) {
            const line = `[${logLine.level}] ${logLine.data.map(it => it.toString()).join(' ')}`;
            writer.write(line);
            writer.write('\n');
        }
        writer.flush()
        writer.end();
    }
}