import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
const cache = new Map();
export async function getAgentDB(agent) {
    if (!cache.has(agent)) {
        const db = open({
            filename: './data-' + agent + '.sqlite',
            driver: sqlite3.Database
        });
        cache.set(agent, db);
    }
    return cache.get(agent);
}
