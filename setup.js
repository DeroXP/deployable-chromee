const { exec } = require('child_process');

console.log("Installing system packages...");

exec(
  'apt-get update && ' +
  'apt-get install -y fonts-liberation libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcups2 libgtk-3-0 libnspr4 libnss3 libu2f-udev libvulkan1 wget',
  (error, stdout, stderr) => {
    if (error) {
      console.error(`Error installing packages: ${stderr}`);
      process.exit(1);
    } else {
      console.log(`Packages installed successfully: ${stdout}`);
    }
  }
);

exec("bash ./scripts/install.sh", (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing install.sh: ${stderr}`);
  } else {
    console.log(`install.sh executed successfully: ${stdout}`);
  }
});
