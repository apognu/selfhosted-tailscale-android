TAG=1.25.35-te3619b890-ge66e57fbb08

.PHONY: clean build install

--build upstream/tailscale-debug.apk &: patches/$(TAG).patch
ifndef TAILSCALE_CONTROL_SERVER
	$(error TAILSCALE_CONTROL_SERVER must be provided)
endif

	git clone -b $(TAG) --depth 1 https://github.com/tailscale/tailscale-android.git upstream
	git -C upstream apply ../patches/$(TAG).patch
	make -C upstream tailscale-debug.apk

rebuild: clean --build

install: upstream/tailscale-debug.apk
	adb install upstream/tailscale-debug.apk

clean:
	rm -rf upstream
