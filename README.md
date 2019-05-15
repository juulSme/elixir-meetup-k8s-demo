# Demo

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

# Run in microk8s (in snap-enabled Linux like Ubuntu)

Install microk8s: https://microk8s.io/docs/
```
# Check cluster status (and fix the warnings!)
microk8s.inspect

# Install DNS, dashboard, prometheus and registry
microk8s.enable dns dashboard prometheus registry

# To halt the cluster and stop using resources
microk8s.stop

# To remove the entire thing, freeing up drive space
snap remove microk8s
```

Allow access to the insecure registry by editing `/etc/docker/daemon.json` and adding the registry:
```
{
  "insecure-registries" : ["localhost:32000"]
}
```
Then restart the docker daemon: `sudo systemctl restart docker`.