import React from 'react';
import styles from './index.less';
import { Link } from 'umi';
import {Chart} from '@antv/g2';

export default () => {
  function* helloWorldGerator(){
    yield 'hello';
    yield  'world';
    return 'ending';
  }
  var hw=helloWorldGerator();


  while (!hw.next().done){
    console.log(hw.next())
  }

  return (
    <div>
      <h1 className={styles.title}>{String.raw`Hi\n${2+3}`}
      <Link to="/users">to users</Link>
      </h1>
      <ul>
        <li>{new RegExp(/abc/ig,'i').flags}</li>
        <li>{Math.trunc(-0.734)}</li>
        <li>扩展运送夫将字符串转为真正得数据[...'hello']={[...'hello'].length}</li>
        <li>Array.of(1,3,6)={Array.of(1,3,6)}</li>
        <li></li>
      </ul>

    </div>
  );
}
