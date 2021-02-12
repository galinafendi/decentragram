# decentragram
Decentralized Instagram Smart Contract

Credit: https://github.com/dappuniversity/decentragram

This decentralized social media allows users to tip posts in Ethereum and sorts the posts based on amount of tips.

To get started:

-download the Metamask Chrome extension and sign up (save your mnemonic!!)
-download Ganache - click on Quickstart

In Metamask, click on "Create Custom RPC" and fill in the fields:
-Name: Ganache
-URL: http://localhost:7545
-Chain ID: 1337
-Currency Symbol: ETH


Install node modules with command: npm install
Open the project with command: npm run start

In the project browser window, click on the Metamask extension and ensure it is connected to the Ganache network. Then click on Import Account and paste in the private key of an account found in Ganache. Refresh the page.

You can now upload images to the feed. After uploading an image and writing a description, click Upload and refresh the page. You can tip the post, Metamask will pop up asking for confirmation. Create multiple accounts on Metamask to simulate multiple users. After every action, refresh the page to see the results.
