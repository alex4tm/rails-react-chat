import React from 'react';
import { emojify } from 'react-emojione';


const Message = (props) => {
  const time = new Date(props.created_at).toLocaleTimeString()
  const content = emojify(props.content);
  return (
    <div className="message-container">
      <i className="author">
        <span>{props.author}</span>
        <small>{time}</small>
      </i>
      <p >{content}</p>
    </div>
  );
};

export default Message;
