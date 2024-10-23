/** @type {import('next').NextConfig} */
module.exports = {
    images: {
        dangerouslyAllowSVG: true,
        formats: ['image/avif', 'image/webp'],
        remotePatterns: [
            {
                protocol: 'https',
                hostname: 'api.dicebear.com',
                port: '',
                pathname: '/7.x/**',
            },
        ],
    },
    experimental: {
        forceSwcTransforms: true,
    },
};
