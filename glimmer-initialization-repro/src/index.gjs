import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { untrack } from '@glimmer/validator';

export class Demo {
  @tracked foo;

  whisperUpdate = (secret) => {
  // This is bad.
    untrack(() => {
      this.foo = secret;
    });
  };
}

export class DemoComponent extends Component {
  @tracked foo;

  whisperUpdate = (secret) => {
  // This is bad.
    untrack(() => {
      this.foo = secret;
    });
  };

  // This is bad.
  <template>
    {{(this.whisperUpdate @foo)}}

    {{this.foo}}
  </template>
}
