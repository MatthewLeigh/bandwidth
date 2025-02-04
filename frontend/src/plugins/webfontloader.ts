/**
 * plugins/webfontloader.js
 *
 * webfontloader documentation: https://github.com/typekit/webfontloader
 */

export async function loadFonts () {
  const webFontLoader = await import(/* webpackChunkName: "webfontloader" */'webfontloader')

  webFontLoader.load({
    custom: {
        families: [
            'Poppins',
            'Poppins-Bold',
            'Poppins-SemiBold',
            'Poppins-ExtraLight',
            'Poppins-Thin'
        ],
        urls: ['/fonts/fonts.css']
    }
  })
}
