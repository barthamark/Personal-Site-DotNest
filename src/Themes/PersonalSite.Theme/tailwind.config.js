/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './**/*.liquid',
    ],
    theme: {
        extend: {
            typography: {
                DEFAULT: {
                    css: {
                        maxWidth: 'none',
                        color: '#374151',
                        lineHeight: '1.8',
                        '--tw-prose-headings': '#111827',
                        '--tw-prose-links': '#6366F1',
                        h2: {
                            marginTop: '2em',
                            marginBottom: '1em',
                        },
                        p: {
                            marginTop: '1.5em',
                            marginBottom: '1.5em',
                        },
                    },
                },
            },
        },
    },
    plugins: [
        require('@tailwindcss/typography'),
    ],
}
