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
        "localhost:3000/*",
      ],
      ...containerify("OTXO"),
    },
    // Work stuff
    {
      match: [
        "*nldesignsystem*",
        "*nl-design-system*",
        "localhost:6006",
        "localhost:6008",
      ],
      ...containerify("Logius"),
    },
  ],
};
