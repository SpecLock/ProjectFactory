const dotenv = require('dotenv');
const { Avalanche, BinTools, Buffer, Client, Format, BufferReader, BufferWriter } = require('@avalabs/avalanchejs');

// Cargar variables de entorno desde el archivo .env
dotenv.config();

// Inicializar la red de Avalanche
const ava = new Avalanche(process.env.AVALANCHE_NETWORK_URL, 443, 'https');

// Lógica principal de la aplicación
async function main() {
    console.log('Iniciando la aplicación...');

    // Aquí puedes agregar la lógica de tu aplicación utilizando las bibliotecas instaladas
}

// Ejecutar la función principal
main().catch((error) => {
    console.error('Error en la aplicación:', error);
    process.exit(1);
});