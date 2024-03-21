import { module, test } from "qunit";
import { tracked } from "@glimmer/tracking";
import { setupRenderingTest } from "ember-qunit";
import { render } from "@ember/test-helpers";

import { Demo, DemoComponent } from "glimmer-initialization-repro";

module("A test", function (hooks) {
  setupRenderingTest(hooks);

  test("it works", function (assert) {
    assert.ok(Demo);

    let demo = new Demo();

    assert.notOk(demo.foo);

    demo.whisperUpdate("hi");

    assert.strictEqual(demo.foo, "hi");
  });

  test("it renders", async function (assert) {
    class State {
      @tracked value = 0;
    }

    let state = new State();
    await render(
      <template>
        <DemoComponent @foo={{state.value}} />
      </template>
    );

    assert.dom().hasText("0");
  });
});
