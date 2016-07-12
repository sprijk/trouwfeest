var config = {
	log: { label: "trouwfeest" },
	server: {
		host:  process.env.HOST || "localhost",
		port:  parseInt(process.env.PORT || "4000"),
		cookieSecret: "simonenhannahgaantrouwen"
	},
	mongo: process.env.MONGO_URI || "mongodb://localhost/trouwfeest"
};

module.exports = config;
