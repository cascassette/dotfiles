const containerify = (containerName) => ({
  url: (url) => {
    return `ext+container:name=${containerName}&url=${url}`;
  },
});

export default {
  defaultBrowser: "Zen",
  rewrite: [
    // SDIO stuff
    {
      match: [
        "https://github.com/SineDubio*",
        "https://sinedub.io/*",
        "*juce*",
        "*//trello.com*",
      ],
      ...containerify("OTXO"),
    },
    {
      match: (url) => url.hostname === "localhost" && url.port === 3000,
      ...containerify("OTXO"),
    },
    // Work stuff
    {
      match: ["*nldesignsystem*", "*nl-design-system*"],
      ...containerify("Logius"),
    },
    {
      match: (url) =>
        url.hostname === "localhost" && url.port >= 6000 && url.port < 6010,
      ...containerify("Logius"),
    },
    // Blocks
    {
      match: "x.com/*",
      url: (url) => {
        url.host = "xcancel.com";
        return url;
      },
    },
  ],
};
