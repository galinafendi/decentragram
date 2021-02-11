//meme job

pragma solidity ^0.5.0;

contract Decentragram {
  string public name = "Decentragram";

  //store posts - works like a database
  mapping(uint => Image) public images;
  //create dynamic ids
  uint public imageCount = 0;
  //define data structure and data types
  struct Image {
    uint id;
    string hash;
    string description;
    uint tipAmount;
    address payable author;
  }

  event ImageCreated(
    uint id,
    string hash,
    string description,
    uint tipAmount,
    address payable author
  );

  event ImageTipped(
    uint id,
    string hash,
    string description,
    uint tipAmount,
    address payable author
  );

  //create posts
  function uploadImage(string memory _imgHash, string memory _description) public {

    //require image
    require(bytes(_imgHash).length > 0);
    //require description field
    require(bytes(_description).length > 0);
    //require uploader address
    require(msg.sender != address(0x0));

    //increment ids
    imageCount ++;
    //add image to contract
    images[imageCount] = Image(imageCount, _imgHash, _description, 0, msg.sender);

    //trigger post creation event
    emit ImageCreated(imageCount, _imgHash, _description, 0, msg.sender);

  }

  //tip posts
  function tipImageOwner(uint _id) public payable {
    //ensure valid id
    require(_id > 0 && _id <= imageCount);
    //fetch image
    Image memory _image = images[_id];
    //fetch author
    address payable _author = _image.author;
    //send Ether to author
    address(_author).transfer(msg.value);
    //increment tip amount
    _image.tipAmount = _image.tipAmount + msg.value;
    //update the image
    images[_id] = _image;

    //trigger tipping event
    emit ImageTipped(_id, _image.hash, _image.description, _image.tipAmount, _author);
  }
}