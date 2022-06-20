const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["futura-pt-condensed", ...defaultTheme.fontFamily.sans],
      },
      fontSize: {
        xxl: ["12rem", "1"],
      },
    },
  },
};
